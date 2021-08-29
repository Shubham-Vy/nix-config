{ config, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
		./wm.nix
		./audio-pipewire.nix
		./system.nix
		./package.nix
		./python.nix
		./nvidia.nix
		#./nvidia-only.nix
	];



 # Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.xd = {
		isNormalUser = true;
		extraGroups = [ "wheel" "audio" "video" "networkmanager"];
	};

	system.stateVersion = "21.05";

}

