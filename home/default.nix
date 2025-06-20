{
  imports = [ ./persistence.nix ./git.nix ];

  programs.fish = {
    enable = true;
    interactiveShellInit = "set fish_greeting";
  };
}
