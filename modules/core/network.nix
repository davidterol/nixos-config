{ pkgs, host, ... }:
{
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
      "1.1.1.1"
    ];
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
        59010
        59011
        9003
      ];
      allowedUDPPorts = [
        59010
        59011
      ];
    };
  };
environment.etc.hosts.mode = "0644";
  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
