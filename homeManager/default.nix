{ util, lib, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "defaultHome";
    imports = [
        ./pkgs/default.nix
        ./desktops/default.nix
        ./syncthing.nix
        ./switchEnv.nix
        ./spicetify.nix
    ];
} {

    defaultHomePkgs.enable = lib.mkDefault true;
    defaultHomeDesktop.enable = lib.mkDefault true;

    syncthing.enable = lib.mkDefault true;
    switchEnv.enable = lib.mkDefault true;
    spicetify.enable = lib.mkDefault true;

}
