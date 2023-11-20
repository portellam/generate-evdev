## Description
Generates Evdev for the current system. Virtual KVM (Keyboard-Video-Mouse) switch for Libvirt/QEMU virtual machines.

## How-to
#### Usage
  -h, --help                Print this help and exit.
      --dump-xml            Dump QEMU commandline (XML) output to file.
      --hugepages           Include Hugepages as device for Libvirt/QEMU.
      --output-event-paths  Output Event device paths, instead of Input device paths.
      --restart-service     Restart Libvirtd system service after setup.
      --set-user            Sets user ownership of Libvirt Input devices to current user. Default is root.
      --undo-changes        Undo changes; restore file backups.

## What is VFIO?
* see hyperlink:    https://www.kernel.org/doc/html/latest/driver-api/vfio.html
* community:        https://old.reddit.com/r/VFIO
* a useful guide:   https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF