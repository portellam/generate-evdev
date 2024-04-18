#!/bin/bash/env bash

#
# Filename:       installer.bash
# Description:    Manages project files.
# Author(s):      Alex Portell <github.com/portellam>
# Maintainer(s):  Alex Portell <github.com/portellam>
# Version:        1.0.0
#

# <params>
  # <summary>Execution Flags</summary>
    declare -g DO_INSTALL=true
    declare -g UPDATE_ETC_SOURCE_FILE=false

  declare -r SCRIPT_VERSION="1.0.0"
  declare -r SCRIPT_NAME="$( basename ${0} )"
  declare -r REPO_NAME="generate-evdev"

  # <summary>
  # Color coding
  # Reference URL: 'https://www.shellhacks.com/bash-colors'
  # </summary>
    declare -gr SET_COLOR_GREEN='\033[0;32m'
    declare -gr SET_COLOR_RED='\033[0;31m'
    declare -gr SET_COLOR_YELLOW='\033[0;33m'
    declare -gr RESET_COLOR='\033[0m'

  # <summary>Append output</summary>
    declare -gr PREFIX="${SCRIPT_NAME}: "
    declare -gr PREFIX_ERROR="${PREFIX}${SET_COLOR_YELLOW}An error occurred:${RESET_COLOR} "
    declare -gr PREFIX_FAIL="${PREFIX}${SET_COLOR_RED}Failure:${RESET_COLOR} "
    declare -gr PREFIX_PASS="${PREFIX}${SET_COLOR_GREEN}Success:${RESET_COLOR} "
# </params>

# <functions>
  function main
  {
    if [[ $( whoami ) != "root" ]]; then
      print_error_to_log "User is not sudo or root."
      return 1
    fi

    get_option "${1}" || return 1

    local -r source_path=$( pwd )
    local -r bin_target_path="/usr/local/bin/"
    local -r bin_source_path="${source_path}/bin/"
    local -r etc_target_path="/usr/local/etc/${REPO_NAME}.d/"
    local -r etc_source_path="${source_path}/etc/"

    if "${UPDATE_ETC_SOURCE_FILE}"; then
      update || return 1
    fi

    if "${DO_INSTALL}"; then
      install || return 1
    else
      uninstall || return 1
    fi
  }

  # <summary>Loggers/summary>
    function print_error_to_log
    {
      echo -e "${PREFIX_ERROR}${1}" >&2
    }

    function print_fail_to_log
    {
      echo -e "${PREFIX_FAIL}${1}" >&2
    }

    function print_pass_to_log
    {
      echo -e "${PREFIX_PASS}${1}" >&1
    }

  # <summary>Usage</summary>
    function get_option
    {
      case "${1}" in
        "-i" | "--install" )
          DO_INSTALL=true ;;

        "-u" | "--uninstall" )
          DO_INSTALL=false ;;

        "-U" | "--update" )
          UPDATE_ETC_SOURCE_FILE=true ;;

        "-h" | "--help" )
          print_usage
          return 1 ;;

        "" )
          return 0 ;;

        * )
          print_help
          return 1 ;;
      esac
    }

    function print_help
    {
      echo -e "Try 'sudo bash ${SCRIPT_NAME} --help' for usage."
    }

    function print_usage
    {
      IFS=$'\n'

      local -ar output=(
        "Usage:\tbash installer.bash [OPTION]"
        "Manages ${REPO_NAME} binaries and files."
        "Version ${SCRIPT_VERSION}.\n"
        "  -h, --help\t\tPrint this help and exit."
        "  -U, --update\t\tUpdate qemu.conf source file before install or uninstall."
        "  -i, --install\t\tInstall ${REPO_NAME} to system."
        "  -u, --uninstall\tUninstall ${REPO_NAME} from system."
      )

      echo -e "${output[*]}"
      unset IFS
    }

  # <summary>Checks</summary>
    function do_binaries_exist
    {
      cd "${bin_source_path}" || return 1

      if [[ ! -e "${REPO_NAME}" ]]; then
        print_error_to_log "Missing project binaries."
        return 1
      fi
    }

    function do_files_exist
    {
      cd "${etc_source_path}" || return 1

      if [[ ! -e "qemu.conf" ]]; then
        print_error_to_log "Missing project files. Please update source files by executing 'sudo bash ${SCRIPT_NAME} --update'."
        return 1
      fi
    }

    function does_target_path_exist
    {
      if [[ ! -d "${bin_target_path}" ]]; then
        print_error_to_log "Could not find directory '${bin_target_path}'."
        return 1
      fi

      if [[ ! -d "${etc_target_path}" ]] \
        && ! sudo mkdir --parents "${etc_target_path}"; then
        print_error_to_log "Could not create directory '${etc_target_path}'."
        return 1
      fi
    }

  # <summary>Execution</summary>
    function copy_sources_to_targets
    {
      if ! sudo cp --force --recursive "${bin_source_path}"* "${bin_target_path}" &> /dev/null; then
        print_error_to_log "Failed to copy project binaries."
        return 1
      fi

      if ! sudo cp --force --recursive "${etc_source_path}"* "${etc_target_path}" &> /dev/null; then
        print_error_to_log "Failed to copy project file(s)."
        return 1
      fi
    }

    function delete_target_files
    {
      local -r executable="${bin_target_path}${REPO_NAME}"
      local -r targets="${executable}_"

      if ( [[ -e "${executable}" ]] \
          && ! rm --force --recursive "${executable}" &> /dev/null ) \
        || ! rm --force --recursive "${targets}"* &> /dev/null; then
        print_error_to_log "Failed to delete project binaries."
        return 1
      fi

      if [[ -d "${etc_target_path}" ]] \
        && ! rm --force --recursive "${etc_target_path}" &> /dev/null; then
        print_error_to_log "Failed to delete project file(s)."
        return 1
      fi
    }

    function install
    {
      if ! do_binaries_exist \
        || ! do_files_exist \
        || ! does_target_path_exist \
        || ! set_target_file_permissions \
        || ! copy_sources_to_targets; then
        print_fail_to_log "Could not install ${REPO_NAME}."
        return 1
      fi

      print_pass_to_log "Installed ${REPO_NAME}."
    }

    function set_target_file_permissions
    {
      if ! sudo chown --recursive root:root "${bin_target_path}" &> /dev/null \
        || ! sudo chmod --recursive +x "${bin_target_path}" &> /dev/null \
        || ! sudo chown --recursive root:root "${etc_target_path}" &> /dev/null; then
        print_error_to_log "Failed to set file permissions."
        return 1
      fi
    }

    function uninstall
    {
      if ! delete_target_files; then
        print_fail_to_log "Could not uninstall ${REPO_NAME}."
        return 1
      fi

      print_pass_to_log "Uninstalled ${REPO_NAME}."
    }

    function update
    {
      if ! update_sources; then
        print_fail_to_log "Could not update sources."
      fi

      print_pass_to_log "Updated sources."
    }

    function update_sources
    {
      # TODO: add support for alternate package managers and repositories.

      if ! command -v "apt" &> /dev/null \
        || ! command -v "dpkg" &> /dev/null; then
        print_error_to_log "Linux system is not supported. Please re-try update on a Debian-based system, or with 'apt' and 'dpkg' and Debian repositories installed."
        return 1
      fi

      local -r apt_package="$( dpkg --search /etc/libvirt/qemu.conf | head --lines=1 | awk '{print $1}' | cut --delimiter ':' --fields 1 )"

      if [[ "${apt_package}" == "" ]]; then
        print_error_to_log "Could not find related package for configuration file."
        return 1
      fi

      if ! sudo apt install --reinstall -o Dpkg::Options::="--force-confask,confnew,confmiss" "${apt_package}"; then
        print_error_to_log "Could not reinstall package and configuration files."
        return 1
      fi

      if ! sudo cp --force "/etc/libvirt/qemu.conf" "${source_path}/etc/qemu.conf" &> /dev/null; then
        print_error_to_log "Could not copy latest version of configuration file to source path."
        return 1
      fi
    }
# </functions>

# <code>
  main "${1}"
  exit "${?}"
# </code>