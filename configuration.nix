# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

   boot.kernelPackages = pkgs.linuxPackages_latest;


  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
 #boot.loader.grub.device = "/dev/sda12";
   networking.hostName = "NixOS"; # Define your hostname.
 #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;
   networking.nameservers = [ "192.168.0.1" ];

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
   time.timeZone = "Asia/Kolkata";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
   environment.systemPackages = with pkgs; [ bash mutt firefox git gnupg wget vim curl lynx ];	
  #   wget vim
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
   programs.bash.enableCompletion = true;
   programs.mtr.enable = true;
   programs.gnupg.agent = { enable = true; enableSSHSupport = true; };
   hardware.pulseaudio.enable = true;
  # List services that you want to enable:

 # Add file system entries for each partition that you want to see mounted
 # at boot time.  You can add filesystems which are not mounted at boot by
 # adding the noauto option.
 fileSystems = [
   # Mount the additional file systems
   #
    { mountPoint = "/home";
      device = "/dev/vghome/lvhome";
    }

    { mountPoint = "/data";
      device = "/dev/data/datalv";
    }
 ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
   services.xserver.enable = true;
   services.xserver.layout = "us";
   services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
   services.xserver.libinput.enable = true;
   services.xserver.synaptics.twoFingerScroll = true;

  # Enable the KDE Desktop Environment.
   #services.xserver.displayManager.sddm.enable = true;
   services.xserver.windowManager.i3.enable = true;
   
  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.extraUsers.bhaskar = {
     isNormalUser = true;
     home = "/home/bhaskar";
     description = "Bhaskar Chowdhury";
     extraGroups = ["wheel" "disk" "audio" "video" "networkmanager" "input" "systemd-journal"];
     uid = 1000;
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "17.09"; # Did you read the comment?

}
