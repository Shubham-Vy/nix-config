{ config, pkgs, lib, stable, rolling, ...}:
{
	nixpkgs.config.allowUnfree = true;
	environment.systemPackages = 

	with pkgs; [

	#Text Editor
		#nano
		vim
		neovim
		#spacevim
		#neovide
		emacs
	#basic utilties
		zsh
		wget
		curl
		sxiv
		feh
		xclip
		dmenu
		rofi
		htop
		powertop
		#nvtop
		mpvc
		maim
		mpv
		tdrop
		sxhkd
		dunst
		gnome.gucharmap
		networkmanagerapplet
		pavucontrol
	#Bar
		polybar
	#Terminal
		alacritty
		kitty
	#Filemanager
		#xfce.thunar
		#xfce.thunar-volman
		#xfce.thunar-archive-plugin
		pcmanfm
		ranger
	#Browser
		brave
		#firefox
		#chromium
	#xorg##################################################
		xorg.xcbutilimage
		xorg.xcbutilrenderutil
		libglvnd
		xorg.libX11
		xorg.libxcb
		xorg.libXext
		libdbusmenu
		libGL
		libGLU
	#devel-tools-utils
		git
		meson
		ninja
		gcc
		mtools
		cmake
		rsync
		pcre
		pev
		pkg-config
		acpi
		asciidoc
		uthash
		gcc-arm-embedded
		binutils
		pciutils
		bintools
		dosfstools
		nodePackages.npm
		mesa
		mesa-demos
		lasem
		libdrm
	#themes/icons##########################################
		lxappearance
		dracula-theme
		gruvbox-dark-gtk
		gruvbox-dark-icons-gtk
		icon-slicer
		pop-icon-theme
		arc-icon-theme
		numix-icon-theme
		gnome-icon-theme
		hicolor-icon-theme
		sweet
	];
	
	
}

