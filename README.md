# Generate Evdev
### v1.0.1
Easily setup a virtual Keyboard-Video-Mouse (KVM) switch for Libvirt/QEMU
Virtual Machines (VMs).

**Download the Latest Release:**&ensp;[Codeberg][codeberg-releases],
[GitHub][github-releases]

[codeberg-releases]: https://codeberg.org/portellam/generate-evdev/releases/latest
[github-releases]:   https://github.com/portellam/generate-evdev/releases/latest

## Table of Contents
- [Why?](#why)
- [Related Projects](#related-projects)
- [Documentation](#documentation)
- [How to Use](#how-to-use)
- [Download](#download)
- [Usage](#usage)
- [Filenames and pathnames modified](#filenames-and-pathnames-modified)
- [Contact](#contact)
- [References](#references)

## Contents
### Why?
Switch device inputs between Host and VM(s) or Guest(s). Requires devices to
remain connected to be seen by Guests (similar to the limitations within the
PS/2 cable standard, unlike USB).

### Related Projects
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

### Documentation
- [What is VFIO?](#3)
- [VFIO Forum](#2)
- [PCI Passthrough Guide](#1)

### How to Use
Press `L-CTRL` + `R-CTRL` to switch between Guests.

### Download
- To download this script, you may:
  - Download the Latest Release:&ensp;[Codeberg][codeberg-releases],
[GitHub][github-releases]

  - Download the ZIP file:
    1. Viewing from the top of the repository's (current) webpage, click the
       drop-down icon:
      - `···` on Codeberg.
      - `<> Code ` on GitHub.

    2. Click `Download ZIP`. Save this file.

    3. Open the `.zip` file, then extract its contents.

  - Clone the repository:
    1. Open a Command Line Interface (CLI).
      - Open a console emulator (for Debian systems: Konsole).
      - Open a existing console: press `CTRL` + `ALT` + `F2`, `F3`, `F4`, `F5`,
      or `F6`.
        - **To return to the desktop,** press `CTRL` + `ALT` + `F7`.
        - `F1` is reserved for debug output of the Linux kernel.
        - `F7` is reserved for video output of the desktop environment.
        - `F8` and above are unused.

    2. Change your directory to your home folder or anywhere safe: `cd ~`

    3. Clone the repository:
      - `git clone https://www.codeberg.org/portellam/generate-evdev`
      - `git clone https://www.github.com/portellam/generate-evdev`

- To make this script executable, you must:
  1. Open the CLI (see above).

  2. Go to the directory of where the cloned/extracted repository folder is:
  `cd name_of_parent_folder/generate-evdev/`

  3. Make the installer script file executable: `chmod +x installer.bash`
    - Do **not** make any other script files executable. The installer will perform
      this action.
    - Do **not** make any non-script file executable. This is not necessary and
      potentially dangerous.

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

### Filenames and pathnames modified
#### 1. System configuration files
  - `/etc/libvirt/qemu.conf`

#### 2. Paths for project binaries and files
  - `/usr/local/bin/generate-evdev`
  - `/usr/local/etc/generate-evdev.d/`

### Contact
Did you encounter a bug? Do you need help? Please visit the **Issues page**
([Codeberg][codeberg-issues], [GitHub][github-issues]).

[codeberg-issues]: https://codeberg.org/portellam/generate-evdev/issues
[github-issues]:   https://github.com/portellam/generate-evdev/issues

### References
#### 1.
**PCI passthrough via OVMF**. ArchWiki. Accessed June 14, 2024.
<sup>https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF.</sup>

#### 2.
**r/VFIO**. Accessed June 14, 2024.
<sup>https://www.reddit.com/r/VFIO/.</sup>

#### 3.
**VFIO - ‘Virtual Function I/O’ - The Linux Kernel Documentation**.
The linux kernel. Accessed June 14, 2024.
<sup>https://www.kernel.org/doc/html/latest/driver-api/vfio.html.</sup>