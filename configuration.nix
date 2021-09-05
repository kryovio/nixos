{ config, pkgs, ... }:

{
    imports =
        [
            ./hardware-configuration.nix
        ];

    boot.loader.grub.enable = true;
    boot.loader.grub.devices = [ "nodev" ];
    boot.loader.grub.efiInstallAsRemovable = true;
    boot.loader.grub.efiSupport = true;
    boot.loader.grub.useOSProber = true;

    networking.useDHCP = false;
    networking.interfaces.enp0s3.useDHCP = true;
    # networking.interfaces.wlp2s0.useDHCP = true;
    networking.networkmanager.enable = true;

    i18n.defaultLocale = "en_AU.UTF-8";
    console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
    };

    time.timeZone = "Australia/Brisbane";

    environment.systemPackages = with pkgs; [
        wget
        vim
        firefox
    ]

    sound.enable = true;
    hardware.pulseaudio.enable = true;
    hardware.pulseaudio.support32Bit = true;

    services.xserver.enable = true;
    services.xserver.layout = "us";

    services.xserver.displayManager.lightdm.enable = true;
    services.xserver.desktopManager.xfce.enable = true;

    users.users.crispy = {
        isNormalUser = true;
        extraGroups = [ "wheel" "audio" "video" ];
    };
}