{ ... }:

{
  security.rtkit.enable = true;
  virtualisation.libvirtd.enable = true;
  services.flatpak.enable = true;
  systemd.user.services.kde-baloo.environment = {
    QT_QPA_PLATFORM = "offscreen";
  };
}
