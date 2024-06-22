# Generate Evdev
### v1.0.1
Easily setup a virtual Keyboard-Video-Mouse (KVM) switch for Libvirt/QEMU
Virtual Machines (VMs) or Guests. Press a macro (`L-CTRL` + `R-CTRL`) to switch
between Host and Guest(s).

## [Download](#5-download)

## Table of Contents
- [1. Why?](#1-why)
- [2. Related Projects](#2-related-projects)
- [3. Documentation](#3-documentation)
- [4. Host Requirements](#4-host-requirements)
    - [4.1. Operating Systems ](#41-operating-systems)
    - [4.2. Software](#42-software)
    - [4.3. Hardware](#43-hardware)
- [5. Download](#5-download)
- [6. Usage](#6-usage)
    - [6.1. Verify Installer is Executable](#61-verify-script-is-executable)
    - [6.2. `installer.bash`](#62-installerbash)
    - [6.3. `generate-evdev`](#63-generate-evdev)
    - [6.4. Input Macro to Switch Between Guests](#64-input-macro-to-switch-between-guests)
- [7. Filenames and Pathnames Modified by Generate Evdev](#7-filenames-and-pathnames-modified-by-generate-evdev)
    - [7.1. System Files](#71-system-files)
    - [7.2. Binaries and Files](#72-binaries-and-files)
- [8. Contact](#8-contact)
- [9. References](#9-references)

## Contents
### 1. Why?
Switch device inputs between Host and Guest(s). Requires devices to remain
connected to be seen and usable by Guests (similar to the limitations within the
old PS/2 cable standard, unlike USB).

### 2. Related Projects
| Project                             | Codeberg          | GitHub          |
| :---                                | :---:             | :---:           |
| Deploy VFIO                         | [link][codeberg1] | [link][github1] |
| Auto X.Org                          | [link][codeberg2] | [link][github2] |
| **Generate Evdev**                  | [link][codeberg3] | [link][github3] |
| Guest Machine Guide                 | [link][codeberg4] | [link][github4] |
| Libvirt Hooks                       | [link][codeberg5] | [link][github5] |
| Power State Virtual Machine Manager | [link][codeberg6] | [link][github6] |

[codeberg1]: https://codeberg.org/portellam/deploy-VFIO
[github1]:   https://github.com/portellam/deploy-VFIO
[codeberg2]: https://codeberg.org/portellam/auto-xorg
[github2]:   https://github.com/portellam/auto-xorg
[codeberg3]: https://codeberg.org/portellam/generate-evdev
[github3]:   https://github.com/portellam/generate-evdev
[codeberg4]: https://codeberg.org/portellam/guest-machine-guide
[github4]:   https://github.com/portellam/guest-machine-guide
[codeberg5]: https://codeberg.org/portellam/libvirt-hooks
[github5]:   https://github.com/portellam/libvirt-hooks
[codeberg6]: https://codeberg.org/portellam/powerstate-virtmanager
[github6]:   https://github.com/portellam/powerstate-virtmanager

### 3. Documentation
- [What is VFIO?](#2)
- [VFIO Discussion and Support](#3)
- [Hardware-Passthrough Guide](#1)
- [Virtual Machine XML Format Guide](#4)

### 4. Host Requirements
#### 4.1. Operating System
Linux.

#### 4.2. Software
- `Libvirt`
- `QEMU`

#### 4.3. Hardware
IOMMU is supported (by the CPU) and enabled in the motherboard firmware (BIOS
or UEFI).
  - For AMD machines:&nbsp;`AMD-Vi`
  - For Intel machines:&ensp;&nbsp;`VT-d`
  - For ARM architectures:&nbsp;`SMMU`

### 5. Download
- Download the Latest Release:&ensp;[Codeberg][codeberg-releases],
[GitHub][github-releases]

- Download the `.zip` file:
    1. Viewing from the top of the repository's (current) webpage, click the
        drop-down icon:
        - `···` on Codeberg.
        - `<> Code ` on GitHub.
    2. Click `Download ZIP` and save.
    3. Open the `.zip` file, then extract its contents.

- Clone the repository:
    1. Open a Command Line Interface (CLI).
        - Open a console emulator (for Debian systems: Konsole).
        - Open a existing console: press `CTRL` + `ALT` + `F2`, `F3`, `F4`, `F5`,  or
        `F6`.
            - **To return to the desktop,** press `CTRL` + `ALT` + `F7`.
            - `F1` is reserved for debug output of the Linux kernel.
            - `F7` is reserved for video output of the desktop environment.
            - `F8` and above are unused.
    2. Change your directory to your home folder or anywhere safe:
        - `cd ~`
    3. Clone the repository:
        - `git clone https://www.codeberg.org/portellam/libvirt-hooks`
        - `git clone https://www.github.com/portellam/libvirt-hooks`

[codeberg-releases]: https://codeberg.org/portellam/libvirt-hooks/releases/latest
[github-releases]:   https://github.com/portellam/libvirt-hooks/releases/latest

### 6. Usage
#### 6.1. Verify Installer is Executable
1. Open the CLI (see [Download](#5-download)).

2. Go to the directory of where the cloned/extracted repository folder is:
`cd name_of_parent_folder/libvirt-hooks/`

3. Make the installer script file executable: `chmod +x installer.bash`
    - Do **not** make any other script files executable. The installer will perform
  this action.
    - Do **not** make any non-script file executable. This is not necessary and
  potentially dangerous.

#### 6.2. `installer.bash`
- From within the project folder, execute: `sudo bash installer.bash`

```
  -h, --help       Print this help and exit.
  -U, --update     Update qemu.conf source file before install or uninstall.
  -i, --install    Install generate-evdev to system.
  -u, --uninstall  Uninstall generate-evdev from system.
```

#### 6.3. `generate-evdev`
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

#### 6.4. Input Macro to Switch Between Guests
To switch input devices between the Host machine and any running Guest, an input
macro must be pressed. The default is `L-CTRL` + `R-CTRL`. This macro may be
changed for each individual Guest in its XML configuration. You may review the
[Libvirt documentation](#5) to learn more.

### 7. Filenames and Pathnames Modified by Generate Evdev
#### 7.1. System Files
  - `/etc/libvirt/qemu.conf`

#### 7.2. Binaries and Files
  - `/usr/local/bin/generate-evdev`
  - `/usr/local/etc/generate-evdev.d/`

### 8. Contact
Did you encounter a bug? Do you need help? Please visit the **Issues page**
([Codeberg][codeberg-issues], [GitHub][github-issues]).

[codeberg-issues]: https://codeberg.org/portellam/generate-evdev/issues
[github-issues]:   https://github.com/portellam/generate-evdev/issues

### 9. References
#### 1.
**PCI passthrough via OVMF**. ArchWiki. Accessed June 14, 2024.
<sup>https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF.</sup>

#### 2.
**VFIO - ‘Virtual Function I/O’ - The Linux Kernel Documentation**.
The linux kernel. Accessed June 14, 2024.
<sup>https://www.kernel.org/doc/html/latest/driver-api/vfio.html.</sup>

#### 3.
**VFIO Discussion and Support**. Reddit. Accessed June 14, 2024.
<sup>https://www.reddit.com/r/VFIO/.</sup>

#### 4.
**XML Design Format**. GitHub - libvirt/libvirt. Accessed June 18, 2024.
<sup>https://github.com/libvirt/libvirt/blob/master/docs/formatdomain.rst.</sup>

#### 5.
**XML Design Format: Input Devices**. GitHub - libvirt/libvirt.Accessed June 18,
2024.
<sup>https://github.com/libvirt/libvirt/blob/master/docs/formatdomain.rst.</sup>