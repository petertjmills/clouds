{ config, lib, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./disk-config.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  # Define on which hard drive you want to install Grub.
#   boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
  
  networking.hostName = "cumulus"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/London";

  
  nix.settings.experimental-features = [ "nix-command" "flakes"];
  environment.systemPackages = with pkgs; [
    wget
    git
    curl
    wget
    neofetch
  ];


  services = {
    openssh.enable = true;
  };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  users.users.root.openssh.authorizedKeys.keys=[
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO8tQOhDkrQO4q3W7JdernvtL1v+aiNsjozN41qrfs2n Silversurfer"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHyxwQIShLIk/qHVnEkRWC+7/V82brDH3s0tBwpnttVi macmini"
  ];

  system.stateVersion = "23.11"; # Did you read the comment?

}