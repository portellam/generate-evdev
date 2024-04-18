# generate-evdev
Easily setup a virtual Keyboard-Video-Mouse (KVM) switch for Libvirt/QEMU Virtual Machines (VMs).

**[View master branch...](https://github.com/portellam/generate-evdev/tree/develop)**

#### Related Projects:
**[Auto X.Org](https://github.com/portellam/auto-xorg) | [Deploy VFIO](https://github.com/portellam/deploy-vfio) | [Guest Machine Guide](https://github.com/portellam/guest-machine-guide) | [Libvirt Hooks](https://github.com/portellam/libvirt-hooks) | [Power State Virtual Machine Manager](https://github.com/portellam/powerstate-virtmanager)**

## Table of Contents
- [Why?](#why)
- [How to Use](#how-to-use)
- [Download](#download)
- [Usage](#usage)
  - [1. `installer.bash`](#1-installerbash)
  - [2. `generate-evdev`](#2-generate-evdev)
- [Filenames and pathnames modified](#filenames-and-pathnames-modified)
  - [1. System configuration files](#1-system-configuration-files)
  - [2. Paths for project binaries and files](#2-paths-for-project-binaries-and-files)
- [Contact](#contact)

## Contents
### Why?
Switch device inputs between Host and VM(s) or Guest(s). Requires devices to remain connected to be seen by Guests (similar to the limitations within the PS/2 cable standard, unlike USB).

### How to Use
1. Press `L-CTRL` + `R-CTRL` to switch between Guests.

### Download
- To download this script, you may:
  - Download the ZIP file:
    1. Viewing from the top of the repository's (current) webpage, click the green `<> Code ` drop-down icon.
    2. Click `Download ZIP`. Save this file.
    3. Open the `.zip` file, then extract its contents.

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

- To make this script executable, you must:
  1. Open the CLI (see above).
  2. Go to the directory of where the cloned/extracted repository folder is: `cd name_of_parent_folder/generate-evdev/`
  3. Make the installer script file executable: `chmod +x installer.bash`
    - Do **not** make any other script files executable. The installer will perform this action.
    - Do **not** make any non-script file executable. This is not necessary and potentially dangerous.

### Usage
#### 1. `installer.bash`
- From within the project folder, execute: `sudo bash installer.bash`

```
  -h, --help       Print this help and exit.
  -U, --update     Update qemu.conf source file before install or uninstall.
  -i, --install    Install generate-evdev to system.
  -u, --uninstall  Uninstall generate-evdev from system.
```

#### 2. `generate-evdev`
- From any folder, execute: `sudo bash generate-evdev`
  - The CLI's shell (bash) should recognize that the script file is located in `/usr/local/bin`.

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

### Filenames and pathnames modified
#### 1. System configuration files
  - `/etc/libvirt/qemu.conf`

#### 2. Paths for project binaries and files
  - `/usr/local/bin/generate-evdev`
  - `/usr/local/etc/generate-evdev.d/`

### Contact
Did you encounter a bug? Do you need help? Notice any dead links? Please contact by [raising an issue](https://github.com/portellam/generate-evdev/issues) with the project itself.
