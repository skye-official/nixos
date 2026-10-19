{ pkgs, ... }:

{
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 100;
  };

  console = {
    useXkbConfig = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
    packages = [ pkgs.terminus_font ];
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
      prime.offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}
