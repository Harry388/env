{ util, pkgs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "flatpak";
} {

    services.flatpak.enable = true;

}
