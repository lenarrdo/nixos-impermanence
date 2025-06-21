{ config, pkgs, ... }:

{
  imports = [ ./starship.nix ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      fish_vi_key_bindings

      set fish_greeting

      set fish_cursor_default block
      set fish_cursor_insert block
    '';

    binds = {
      "\\co" = {
        command = "yy; commandline -f repaint";
        mode = "insert";
      };
      "\\cf" = {
        command = "tmuxa; commandline -f repaint";
        mode = "insert";
      };
    };

    shellAbbrs = {
      lg = "lazygit";
      ff = "fastfetch";
      la = "eza --group-directories-first --almost-all --long --icons=always";
    };

    functions = {
      tmuxa = ''
	set tmuxRunning (pgrep -c tmux)
	if test $tmuxRunning -eq 0
	  tmux new-session
	else
	  set numberOfSessions (tmux ls | wc -l)
	  if test $numberOfSessions -eq 1
	    tmux attach
	  else
	    echo "Which session do you want to attach to?"
	    tmux ls
	    read -P "=> " ans
	    tmux attach -t (string trim $ans)
	  end
	end
      '';
      dly = ''
	set dir "$HOME/dlog/$(date "+%Y")/$(date "+%m-%B")"
	set file "$dir/$(date '+%Y-%b-%d').md"

	if not test -d $dir
	  mkdir -p "$dir"
	  echo "Created new directory: $dir"
	end

	if not test -e $file
	  touch "$file"
	  echo "Created new daily note: $file"
	end

	$EDITOR "$file"
      '';
    };
  };
}
