{ config, lib, pkgs, ...}: with lib;
{
 # Use the systemd-boot EFI boot loader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
 # Time zone
	time.timeZone = "Asia/Kolkata";

 # NetWorking
	networking.hostName = "nixos";
	networking.useDHCP = false;
	networking.interfaces.enp3s0.useDHCP = true;
	networking.interfaces.wlo1.useDHCP = true;
	networking.networkmanager.enable = true;

 # Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";
	console = {

		font = "Lat2-Terminus16";
		keyMap = "us";
	};

 # Enable the X11 windowing system.
	hardware.opengl.enable = true;
	hardware.opengl.driSupport = true;
	services.blueman.enable = true;
	hardware.bluetooth.enable = true;
	security.rtkit.enable = true;

 # Enable touchpad support (enabled default in most desktopManager).
	services.xserver.libinput.enable = true;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
   users.defaultUserShell = "/run/current-system/sw/bin/zsh";
 # light
   programs.light.enable = true;
 # locate
   services.locate.enable = true;
 # picom
	services.picom.enable = true;
 # Enable the OpenSSH daemon.
	# services.openssh.enable = true;

 # Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

}

