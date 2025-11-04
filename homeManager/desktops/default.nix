{ util, lib, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "defaultHomeDesktop";
    imports = [
        ./gnome.nix
        ./waylandWM.nix
    ];
} {

    gnomeHome.enable = lib.mkDefault false;
    waylandWMHome.enable = lib.mkDefault true;

}
