{ config, lib, pkgs, ...}: with lib;
 # Enable the X11 windowing system.
{
	services.xserver = {
		enable = true;
		layout = "us";
# for bspwm
	windowManager.bspwm = {
		enable = true;
		configFile = "/home/xd/.config/bspwm/bspwmrc";
		sxhkd.configFile= "/home/xd/.config/bspwm/sxhkd/sxhkdrc";
	};
# for xmonad
	windowManager.xmonad = {
		enable = true;
		enableContribAndExtras = true;
		extraPackages = hpkgs: [
			hpkgs.xmonad
			hpkgs.xmonad-contrib
			hpkgs.xmonad-extras
		];
	};
	

#  For lightdm_____________________________________________
		displayManager.lightdm.enable = true;
		displayManager.defaultSession = "none+bspwm"; # WM == name of wm

#  For Startx_______________________________________________
		#displayManager.startx.enable = true;

	};
  services.xrdp.defaultWindowManager = "bspwm";
}
