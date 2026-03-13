{ util, lib, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "defaultDesktop";
    imports = [
        ./gnome.nix
        ./niri.nix
    ];
} {

    gnome.enable = lib.mkDefault false;
    niri.enable = lib.mkDefault true;

}
