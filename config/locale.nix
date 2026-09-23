{ pkgs, ... }:

{
  time.timeZone = "Asia/Shanghai";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          fcitx5-gtk
          qt6Packages.fcitx5-chinese-addons
          qt6Packages.fcitx5-configtool
        ];
      };
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
    fontconfig = {
      defaultFonts = {
        sansSerif = [ "Noto Sans CJK SC" ];
        serif = [ "Noto Serif CJK SC" ];
        monospace = [
          "Code New Roman"
          "Noto Sans Mono CJK SC"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };

  console = {
    useXkbConfig = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
    packages = [ pkgs.terminus_font ];
  };
}
