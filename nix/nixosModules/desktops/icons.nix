{

    flake.nixosModules.icons = { pkgs, ... }: {

        environment.systemPackages = with pkgs; [
            apple-cursor
            banana-cursor
            papirus-icon-theme
        ];

        # NOTE: papirus icon theme is set in environment/config/gtk-[3|4].0/settings.ini

        xdg.icons.fallbackCursorThemes = [
            "macOS"
        ];

        environment.variables = {
            XCURSOR_THEME = "macOS";
            XCURSOR_SIZE = "24";
        };

    };

}
