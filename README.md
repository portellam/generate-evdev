# Generate Evdev
### v1.0.2
Easily setup a virtual Keyboard-Video-Mouse (KVM) switch for Libvirt/QEMU
Virtual Machines (VMs).

## [Download](#4-download)
#### View this repository on [Codeberg][01], [GitHub][02].
[01]: https://codeberg.org/portellam/generate-evdev
[02]: https://github.com/portellam/generate-evdev
##

## Table of Contents
- [1. Why?](#1-why)
- [2. Related Projects](#2-related-projects)
- [3. Documentation](#3-documentation)
- [4. Download](#4-download)
- [5. Usage](#5-usage)
- [6. Filenames and pathnames modified](#6-filenames-and-pathnames-modified)
- [7. Contact](#7-contact)
- [8. References](#8-references)

## Contents
### 1. Why?
Switch device inputs between Host and VM(s) or Guest(s). Requires devices to
remain connected to be seen by Guests (similar to the limitations within the
PS/2 cable standard, unlike USB).

### 2. Related Projects
To view other relevant projects, visit [Codeberg][21]
or [GitHub][22].

[21]: https://codeberg.org/portellam/vfio-collection
[22]: https://github.com/portellam/vfio-collection

### 3. Documentation
- What is VFIO?[<sup>[2]</sup>](#2)
- VFIO Discussion and Support[<sup>[3]</sup>](#3)
- Hardware-Passthrough Guide[<sup>[1]</sup>](#1)

### 4. Download
- Download the Latest Release:&ensp;[Codeberg][41], [GitHub][42]

- Download the `.zip` file:
    1. Viewing from the top of the repository's (current) webpage, click the
        drop-down icon:
        - `···` on Codeberg.
        - `<> Code ` on GitHub.
    2. Click `Download ZIP` and save.
    3. Open the `.zip` file, then extract its contents.

- Clone the repository:
    1. Open a Command Line Interface (CLI) or Terminal.
        - Open a console emulator (for Debian systems: Konsole).
        - **Linux only:** Open an existing console: press `CTRL` + `ALT` + `F2`,
        `F3`, `F4`, `F5`, or `F6`.
            - **To return to the desktop,** press `CTRL` + `ALT` + `F7`.
            - `F1` is reserved for debug output of the Linux kernel.
            - `F7` is reserved for video output of the desktop environment.
            - `F8` and above are unused.
    2. Change your directory to your home folder or anywhere safe:
        - `cd ~`
    3. Clone the repository:
        - `git clone https://www.codeberg.org/portellam/generate-evdev`
        - `git clone https://www.github.com/portellam/generate-evdev`

[41]: https://codeberg.org/portellam/generate-evdev/releases/latest
[42]: https://github.com/portellam/generate-evdev/releases/latest

### 5. Usage
#### 5.1. Verify Installer is Executable
1. Open the CLI (see [Download](#4-download)).

2. Go to the directory of where the cloned/extracted repository folder is:
`cd name_of_parent_folder/generate-evdev/`

3. Make the installer script file executable: `chmod +x installer.bash`
    - Do **not** make any other script files executable. The installer will perform
  this action.
    - Do **not** make any non-script file executable. This is not necessary and
  potentially dangerous.

#### 5.2. `installer.bash`
- From within the project folder, execute: `sudo bash installer.bash`

```
  -h, --help       Print this help and exit.
  -U, --update     Update qemu.conf source file before install or uninstall.
  -i, --install    Install generate-evdev to system.
  -u, --uninstall  Uninstall generate-evdev from system.
```

#### 5.3. `generate-evdev`
- From any folder, execute: `sudo bash generate-evdev`
  - The CLI's shell (bash) should recognize that the script file is located in
    `/usr/local/bin`.

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

### 5.4. How to use with an online/running Guest machine
Press `L-CTRL` + `R-CTRL` to switch between Host and Guest.

### 6. Filenames and pathnames modified
#### 6.1. System configuration files
  - `/etc/libvirt/qemu.conf`

#### 6.2. Paths for project binaries and files
  - `/usr/local/bin/generate-evdev`
  - `/usr/local/etc/generate-evdev.d/`

### 7. Contact
Do you need help? Please visit the [Issues][71] page.

[71]: https://github.com/portellam/generate-evdev/issues

### 8. References
#### 1.
&nbsp;&nbsp;**PCI passthrough via OVMF**. ArchWiki. Accessed June 14, 2024.

&nbsp;&nbsp;&nbsp;&nbsp;<sup>https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF.</sup>

#### 2.
&nbsp;&nbsp;**r/VFIO**. Accessed June 14, 2024.

&nbsp;&nbsp;&nbsp;&nbsp;<sup>https://www.reddit.com/r/VFIO/.</sup>

#### 3.
&nbsp;&nbsp;**VFIO - ‘Virtual Function I/O’ - The Linux Kernel Documentation**.
The linux kernel. Accessed June 14, 2024.

&nbsp;&nbsp;&nbsp;&nbsp;<sup>https://www.kernel.org/doc/html/latest/driver-api/vfio.html.</sup>
##

#### Click [here](#generate-evdev) to return to the top of this document.