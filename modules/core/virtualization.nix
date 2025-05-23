{
  config,
  pkgs,
  username,
  ...
}:
{


  # Add user to libvirtd group
  users.users.${username}.extraGroups = [ "libvirtd" ];
  # Install necessary packages
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
    adwaita-icon-theme
    ddev
  ];

  # Manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    docker = {
      enable = true;
      extraOptions = ''
        --storage-opt dm.basesize=20G
        --storage-opt dm.basesize=20G
      '';
      rootless = {
          enable = true;
          setSocketVariable = true;
        };
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;
}
