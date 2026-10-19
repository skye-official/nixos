{ pkgs, ... }:

{
  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          fcitx5-gtk
          fcitx5-m17n
          qt6Packages.fcitx5-configtool
          qt6Packages.fcitx5-chinese-addons
        ];
      };
    };
  };

  services = {
    displayManager.plasma-login-manager.enable = true;
    desktopManager.plasma6.enable = true;

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

    pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa.enable = true;
    };
  };

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      nerd-fonts.code-new-roman
    ];
  };
}
