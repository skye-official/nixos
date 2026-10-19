{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  networking.hostName = "myNixOS";
  time.timeZone = "Asia/Shanghai";

  # PCI topology is specific to this laptop.
  hardware.nvidia.prime = {
    amdgpuBusId = "PCI:5:0:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  # Keep this at the release used to install the machine unless you have read
  # the NixOS release notes and deliberately want to migrate it.
  system.stateVersion = "26.11";
}
