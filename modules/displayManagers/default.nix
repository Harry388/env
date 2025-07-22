{ util, lib, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "defaultDisplayManager";
    imports = [
        ./sddm.nix
    ];
} {

    sddm.enable = lib.mkDefault true;

}
