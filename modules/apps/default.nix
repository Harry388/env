{ util, lib, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "defaultApps";
    imports = [
        ./steam.nix
        ./vial.nix
        ./vicinaeCachix.nix
    ];
} {

    steam.enable = lib.mkDefault true;
    vial.enable = lib.mkDefault true;
    vicinaeCachix.enable = lib.mkDefault true;

}
