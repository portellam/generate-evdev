# generate-evdev
## Directory
- [License](LICENSE.md)

## Table of Contents
- [1. About](#1-about)
- [2. Download](#2-download)
- [3. Usage](#2-usage)
  - [3.1. `installer.bash`](#31-installerbash)
  - [3.2. `generate-evdev`](#32-generate-evdev)
- [4. Filenames and pathnames modified](#4-filenames-and-pathnames-modified)
  - [4.1. System configuration files](#41-system-configuration-files)
  - [4.2. Paths for project binaries and files](#42-paths-for-project-binaries-and-files)
- [5. Contact](#4-contact)

### 1. About
Generates Evdev for the current system. A Virtual KVM (Keyboard-Video-Mouse) for Libvirt, a manager for QEMU/KVM virtual machines.

1. [Evdev (Wikipedia)](https://en.wikipedia.org/wiki/Evdev)
2. [Using Evdev Passthrough: Seamless VM Input (article)](https://passthroughpo.st/using-evdev-passthrough-seamless-vm-input/)
3. [VFIO forum (Reddit)](https://old.reddit.com/r/VFIO)
4. [PCI Passthrough guide (ArchLinux Wiki)](https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF)

## 2. Download
  - Clone the repository:
    1. Open a Command Line Interface (CLI).
      - Open a console emulator (for Debian systems: Konsole).
      - Open a existing console: press `CTRL` + `ALT` + `F2`, `F3`, `F4`, `F5`, or `F6`.
        - **To return to the desktop,** press `CTRL` + `ALT` + `F7`.
        - `F1` is reserved for debug output of the Linux kernel.
        - `F7` is reserved for video output of the desktop environment.
        - `F8` and above are unused.

    2. Change your directory to your home folder or anywhere safe: `cd ~`
    3. Clone the repository: `git clone https://www.github.com/portellam/generate-evdev`
  - Download the ZIP file:
    1. Viewing from the top of the repository's (current) webpage, click the green `<> Code ` drop-down icon.
    2. Click `Download ZIP`. Save this file.
    3. Open the `.zip` file, then extract its contents.
- To make this script executable, you must:
  1. Open the CLI (see above).
  2. Go to the directory of where the cloned/extracted repository folder is: `cd name_of_parent_folder/generate-evdev/`
  3. Make the installer script file executable: `chmod +x installer.bash`
    - Do **not** make any other script files executable. The installer will perform this action.
    - Do **not** make any non-script file executable. This is not necessary and potentially dangerous.

## 3. Usage
### 3.1. `installer.bash`
- From within the project folder, execute: `sudo bash installer.bash`

```
  -h, --help       Print this help and exit.
  -U, --update     Update qemu.conf source file before install or uninstall.
  -i, --install    Install generate-evdev to system.
  -u, --uninstall  Uninstall generate-evdev from system.
```

#### 3.2. `generate-evdev`
- From any folder, execute: `sudo bash generate-evdev`
  - The CommandCLI's shell (bash) should recognize that the script file is located in `/usr/local/bin`.

```
-h, --help                Print this help and exit.
    --dump-xml            Dump QEMU commandline (XML) output to file.
    --hugepages           Include Hugepages as device for Libvirt/QEMU.
    --output-event-paths  Output Event device paths only.
    --output-input-paths  Output Input device paths only.
    --restart-service     Restart Libvirtd system service after setup.
    --set-user            Sets user ownership of Libvirt Input devices to current user. Default is root.
    --undo-changes        Undo changes; restore file backups.
```
## 4. Filenames and pathnames modified
### 4.1. System configuration files
  - `/etc/libvirt/qemu.conf`

### 4.2. Paths for project binaries and files
  - `/usr/local/bin/generate-evdev`
  - `/usr/local/etc/enerate-evdev.d/`

## 5. Contact
Did you encounter a bug? Do you need help? Notice any dead links? Please contact by [raising an issue](https://github.com/portellam/generate-evdev/issues) with the project itself.