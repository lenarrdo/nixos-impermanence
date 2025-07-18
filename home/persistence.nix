{ inputs, ... }:

{
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  home.persistence."/nix/persist/home" = {
    allowOther = true;

    directories = [
      ".ssh"
      "dotfiles"
    ];
  };
}
