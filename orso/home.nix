{
  imports = [ ../home ];

  home = {
    username = "leonardo";
    homeDirectory = "/home/leonardo";

    stateVersion = "25.05";
  };

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
