{ config, inputs, ... }:

{
  # fileSystems."/nix/persist".neededForBoot = true;
  environment.persistence."/nix/persist/system" = {
    hideMounts = true;
    directories = [
      "/var/lib/nixos"
      "/var/lib/bluetooth"
    ];
  };
}
