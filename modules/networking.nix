{ ... }:

{
  networking = {
    networkmanager.enable = true;
    firewall.trustedInterfaces = [ "virbr0" ];
  };
}
