{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      mgr = {
        sort_by = "natural";
	scrolloff = 8;
      };

      opener = {
        play = [{
          run = ''mpv --no-terminal --force-window "$@"'';
          orphan = true;
          for = "unix";
        }];
        open = [{
          run = ''xdg-open "$@"'';
          orphan = true;
          for = "unix";
        }];
        gimp = [{
          run = ''gimp "$@"'';
          orphan = true;
          for = "unix";
        }];
      };

      open = {
        prepend_rules = [{
          mime = "image/*";
          use = [ "open" "gimp" ];
        }];
      };

      tasks = {
        suppress_preload = true;
      };
    };

    keymap.mgr.prepend_keymap = [
      {
        on = [ "<C-o>" ];
        run = ''shell 'ripdrag "$@" -x 2>/dev/null &' --confirm'';
        desc = "Drag and drop selected files";
      }
      {
        on = [ "g" "l" ];
        run = "cd ~/.local";
        desc = "Go to the local directory";
      }
      {
        on = [ "g" "f" ];
        run = "cd ~/flake";
        desc = "Go to the flake directory";
      }
      {
        on = [ "g" "d" ];
        run = "cd ~/documents";
        desc = "Go to the documents directory";
      }
      {
        on = [ "g" "D" ];
        run = "cd ~/downloads";
        desc = "Go to the downloads directory";
      }
      {
        on = [ "g" "." ];
        run = "cd ~/dotfiles";
        desc = "Go to the dotfiles directory";
      }
    ];
  };
}
