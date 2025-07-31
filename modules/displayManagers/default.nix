{ util, lib, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "defaultDisplayManager";
    imports = [
        ./sddm.nix
        ./gdm.nix
    ];
} {

    sddm.enable = lib.mkDefault false;
    gdm.enable = lib.mkDefault true;

}
