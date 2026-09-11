# CM4 boot + serial-console recovery capability, shared across nodes 1-4.
#
# Why this module exists:
#   The `raspberry-pi-4` profile boots via U-Boot + extlinux.conf
#   (boot.loader.generic-extlinux-compatible), but nixos-hardware ships
#   `hardware.raspberry-pi.firmware.uboot.enable = false` by default. Without it
#   no `u-boot.bin` is written to the FIRMWARE partition and `config.txt` gets
#   no `kernel=` line, so the GPU firmware finds nothing to load and the board
#   never boots a kernel -> the UART stays completely silent. Enabling U-Boot is
#   the actual fix for the "blank serial console" symptom.
#
# Serial wiring (Waveshare CM4-IO / Turing Pi CM4):
#   GPIO14/15 = physical pins 8/10 = the mini-UART = ttyS0 while Bluetooth is
#   enabled (the default here; config.txt has no disable-bt). ttyAMA0 (PL011)
#   is on the Bluetooth modem, NOT on the header pins, so the recovery getty
#   must target ttyS0. The kernel console= params (console=ttyS0,115200n8 ...)
#   already come from sd-image-aarch64.nix, so we only need the login prompt.
{ ... }:
{
  # Chainload U-Boot: writes u-boot.bin to the firmware partition and adds
  # `kernel=u-boot.bin` + `arm_64bit=1` to config.txt. This is the fix that
  # makes the image boot at all.
  hardware.raspberry-pi.firmware.uboot.enable = true;

  # Login prompt on the GPIO UART (ttyS0). Kernel boot logs already reach ttyS0
  # via the console= params; without this getty there is no way to log in over
  # serial (the default primary console is tty0/HDMI, so systemd starts no
  # serial getty on its own).
  systemd.services."serial-getty@ttyS0".enable = true;

  # If ttyS0 (mini-UART) ever proves flaky, move the stable PL011 onto the GPIO
  # pins and switch the getty to ttyAMA0 by uncommenting:
  #   hardware.raspberry-pi.configtxt.deviceTreeOverlays.all = [ { disable-bt = { }; } ];
  #   systemd.services."serial-getty@ttyAMA0".enable = true;
}
