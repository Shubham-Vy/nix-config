{ config, lib, pkgs, ...}: with lib;
 # Enable the X11 windowing system.
{
	services.xserver = {
		enable = true;
		layout = "us";
        
        windowManager.bspwm.enable = true;
        #windowManager.default = "bspwm";
        #displayManager.defaultSession = "none+bspwm";
		windowManager.bspwm.configFile = "/home/xd/.config/bspwm/bspwmrc";
		windowManager.bspwm.sxhkd.configFile= "/home/xd/.config/bspwm/sxhkd/sxhkdrc";
        displayManager.startx.enable = true;

	};
  services.xrdp.defaultWindowManager = "bspwm";
}
