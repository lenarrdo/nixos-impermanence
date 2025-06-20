{ config, lib, pkgs, inputs, ... }:

{
  imports = [ ./hardware-configuration.nix ../nixos/default.nix ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "orso";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = lib.mkForce "it";
    useXkbConfig = true;
  };

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Define a user account.
  users.users.leonardo = {
    isNormalUser = true;
    initialPassword = "a";
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
  };

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  programs.fish.enable = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [ just ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  programs.fuse.userAllowOther = true;
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.leonardo = import ./home.nix;
  };

  system.stateVersion = "25.05";
}
