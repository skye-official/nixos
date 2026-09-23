{ pkgs, ... }:

{
  networking = {
    networkmanager.enable = true;
    hostName = "myNixOS";
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = [ pkgs.nvidia-vaapi-driver ];
    };
    nvidia = {
      open = true;
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = false;
      };
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        amdgpuBusId = "PCI:5:0:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  services = {
    xserver = {
      xkb = {
        layout = "us";
        variant = "";
      };
      videoDrivers = [
        "amdgpu"
        "nvidia"
      ];
    };
    displayManager.plasma-login-manager.enable = true;
    desktopManager.plasma6.enable = true;
    flatpak.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
    };
  };
}
