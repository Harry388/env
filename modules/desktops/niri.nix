{ util, pkgs, inputs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "niri";
} {

    programs.niri.enable = true;

    programs.xwayland.enable = true;

    services.udisks2.enable = true;

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
    };

    environment.systemPackages = [
        inputs.xwaylandSatellite.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

}
