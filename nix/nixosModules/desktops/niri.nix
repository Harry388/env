{ inputs, ... }:
{

    flake.nixosModules.niri = { pkgs, ... }: {

        programs.niri.enable = true;
        programs.niri.package = inputs.niri-blur.packages.${pkgs.stdenv.hostPlatform.system}.default;

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
        };

        environment.sessionVariables = {
            NIXOS_OZONE_WL = "1";
        };

        environment.systemPackages = [
            inputs.xwaylandSatellite.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];

    };

}
