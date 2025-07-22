{ util, pkgs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "gvfs";
} {

    services.gvfs.enable = true;

}
