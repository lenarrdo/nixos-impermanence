hostname := `echo $HOSTNAME`

update:
	sudo nixos-rebuild switch --flake .#{{hostname}}

flake:
	nix flake update
