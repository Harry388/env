{ util, lib, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "defaultModules";
    imports = [
        ./desktops/default.nix
        ./apps/default.nix
        ./displayManagers/default.nix
        ./gvfs.nix
        ./keyring.nix
        ./fonts.nix
        ./base.nix
        ./openssh.nix
        ./tailscale.nix
        ./tlp.nix
        ./flatpak.nix
    ];
} {

    defaultDesktop.enable = lib.mkDefault true;
    defaultApps.enable = lib.mkDefault true;
    defaultDisplayManager.enable = lib.mkDefault true;
    gvfs.enable = lib.mkDefault true;
    keyring.enable = lib.mkDefault true;
    fonts.enable = lib.mkDefault true;
    base.enable = lib.mkDefault true;
    openssh.enable = lib.mkDefault false;
    tailscale.enable = lib.mkDefault true;
    tlp.enable = lib.mkDefault false;
    flatpak.enable = lib.mkDefault true;
}
