# Installs the extra packages used with a wayland compositor to create a desktop environment
{ inputs, ... }:

{

    flake.homeModules.waylandWM = { pkgs, inputs, ... }:
    {

        home.pointerCursor = {
            gtk.enable = true;
            # package = pkgs.banana-cursor;
            # name = "Banana";
            # size = 32;
            package = pkgs.apple-cursor;
            name = "macOS";
            size = 24;
        };

        gtk = {
            enable = true;

            iconTheme = {
                package = pkgs.papirus-icon-theme;
                name = "Papirus-Dark";
            };
        };

    };

}
