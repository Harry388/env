# Installs the extra packages used with a wayland compositor to create a desktop environment
{ inputs, ... }:

{

    flake.homeModules.waylandWM = { pkgs, inputs, ... }:
        let
            flameshot = inputs.nixpkgs-13_03_2026.legacyPackages.${pkgs.stdenv.hostPlatform.system}.flameshot.override {
                enableWlrSupport = true;
            };
        in
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

        home.packages = with pkgs; [
            fuzzel
            playerctl
            pavucontrol
            brightnessctl
            grimblast
            hyprpicker
            wayvnc
            wl-clipboard
            wtype
            cava
            networkmanagerapplet
            matugen
            vicinae
            waypipe
            weylus
        ] ++ [
            flameshot
            inputs.wooz.packages.${pkgs.stdenv.hostPlatform.system}.default
            inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];

    };

}
