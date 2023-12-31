## Description
Generates Evdev for the current system. Virtual KVM (Keyboard-Video-Mouse) switch for Libvirt/QEMU virtual machines.

## How-to
#### Installer Usage:
        -h, --help          Print this help and exit.
        -U, --update        Update qemu.conf source file before install or uninstall.
        -i, --install       Install generate-evdev to system.
        -u, --uninstall     Uninstall generate-evdev from system.

#### QEMU configuration file paths:
* System: */etc/libvirt/qemu.conf*
* Source: */usr/local/etc/generate-evdev.d/qemu.conf*

#### Script Usage
        -h, --help                Print this help and exit.
            --dump-xml            Dump QEMU commandline (XML) output to file.
            --hugepages           Include Hugepages as device for Libvirt/QEMU.
            --output-event-paths  Output Event device paths only.
            --output-input-paths  Output Input device paths only.
            --restart-service     Restart Libvirtd system service after setup.
            --set-user            Sets user ownership of Libvirt Input devices to current user. Default is root.
            --undo-changes        Undo changes; restore file backups.

#### XML output file path:
* Source: */usr/local/etc/generate-evdev.d/evdev.xml*

## What is Evdev?
* about:            https://passthroughpo.st/using-evdev-passthrough-seamless-vm-input/
* community:        https://old.reddit.com/r/VFIO
* a useful guide:   https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF
* Wikipedia:        https://en.wikipedia.org/wiki/Evdev