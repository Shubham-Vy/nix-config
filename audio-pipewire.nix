{ config, lib, pkgs, ...}: with lib;
{
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		jack.enable = true;
		media-session.enable = true;

		config.pipewire = {
			"context.properties" = {
			"link.max-buffers" = 64;
            #"link.max-buffers" = 16;
			"log.level" = 2; 
			"default.clock.rate" = 48000;
      		"default.clock.quantum" = 32;
      		"default.clock.min-quantum" = 32;
      		"default.clock.max-quantum" = 32;
			"core.daemon" = true;
    		"core.name" = "pipewire-0";

		};

		"context.modules" = [
      	{
        	name = "libpipewire-module-rtkit";
        		args = {
          		"nice.level" = -15;
      		    	"rt.prio" = 88;
          		"rt.time.soft" = 200000;
          		"rt.time.hard" = 200000;
        	};

        	flags = [ "ifexists" "nofail" ];
      	}
      		{ name = "libpipewire-module-protocol-native"; }
	      	{ name = "libpipewire-module-profiler"; }
			{ name = "libpipewire-module-metadata"; }
			{ name = "libpipewire-module-spa-device-factory"; }
      		{ name = "libpipewire-module-spa-node-factory"; }
      		{ name = "libpipewire-module-client-node"; }
      		{ name = "libpipewire-module-client-device"; }
      	{
        	name = "libpipewire-module-portal";
        	flags = [ "ifexists" "nofail" ];
		}

      	{
        	name = "libpipewire-module-access";
        	args = {};
      	}
      		{ name = "libpipewire-module-adapter"; }
    		{ name = "libpipewire-module-link-factory"; }
      		{ name = "libpipewire-module-session-manager"; }
    ];


		media-session.config.bluez-monitor.rules = [
    		{
      				# Matches all cards
      				matches = [ { "device.name" = "~bluez_card.*"; } ];
      				actions = {
									"update-props" = {
									"bluez5.reconnect-profiles" = [ "hfp_hf" "hsp_hs" "a2dp_sink" ];
									"bluez5.msbc-support" = true;
									"bluez5.sbc-xq-support" = true;
							};
					};
    		}

    		{
      				matches = [
        				{ "node.name" = "~bluez_input.*"; }
        				{ "node.name" = "~bluez_output.*"; }
      			];

      				actions = {
        			"node.pause-on-idle" = false;
				};
			}

	];


	};

	config.pipewire-pulse = {
    		"context.properties" = {
      		"log.level" = 2;
    	};
    	"context.modules" = [
      {
        	name = "libpipewire-module-rtkit";
        	args = {
          		"nice.level" = -15;
       			"rt.prio" = 88;
          		"rt.time.soft" = 200000;
          		"rt.time.hard" = 200000;
			};

        	flags = [ "ifexists" "nofail" ];
      }

      	{ name = "libpipewire-module-protocol-native"; }
      	{ name = "libpipewire-module-client-node"; }
      	{ name = "libpipewire-module-adapter"; }
      	{ name = "libpipewire-module-metadata"; }
		
	{
        name = "libpipewire-module-protocol-pulse";
        	args = {
        		"pulse.min.req" = "32/48000";
          		"pulse.default.req" = "32/48000";
          		"pulse.max.req" = "32/48000";
          		"pulse.min.quantum" = "32/48000";
          		"pulse.max.quantum" = "32/48000";
          		"server.address" = [ "unix:native" ];
        	};
	}

    ];
    	"stream.properties" = {
      	"node.latency" = "32/48000";
      	"resample.quality" = 1;
    	};
  };


    media-session.config.alsa-monitor = {
    rules = [
      {
		  matches = { 
			  "node.name" = "alsa_output.*";
		};

		  actions = {
			update-props = {
				"audio.format" = "S32LE";
				"audio.rate" = 96000;
				"api.alsa.period-size" = 32; 
				#"api.alsa.disable-batch" = true; 
			};
        };
      }
    ];
  };

};


}
