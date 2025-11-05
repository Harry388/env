{ util, pkgs, inputs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "niri";
} {

    programs.niri.enable = true;

    programs.xwayland.enable = true;

    services.udisks2.enable = true;

    xdg.portal = {
        enable = true;
        wlr.enable = true;
        xdgOpenUsePortal = true;
        extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
            xdg-desktop-portal-gnome
        ];
        config.niri = {
            default = ["gnome" "gtk"];
            "org.freedesktop.impl.portal.Access" = "gtk";
            "org.freedesktop.impl.portal.Notification" = "gtk";
            "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
            "org.freedesktop.impl.portal.FileChooser" = "gtk";
            "org.freedesktop.impl.portal.ScreenCast" = "gnome";
            "org.freedesktop.portal.ScreenCast" = "gnome";
        };
    };

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
    };

    environment.systemPackages = [
        inputs.xwaylandSatellite.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

}
