{ util, pkgs, inputs, ... }@confInps: let
    flameshot = pkgs.flameshot.override {
        enableWlrSupport = true;
    };
    vicinae = pkgs.callPackage ./vicinae.nix {
        inherit (pkgs) lib stdenv fetchFromGitHub cmake ninja nodejs qt6 qt6Packages kdePackages protobuf cmark-gfm libqalculate minizip rapidfuzz-cpp;
    };
in util.mkModule {
    inherit confInps;
    name = "hyprlandHome";
} {

    home.pointerCursor = {
        gtk.enable = true;
        x11.enable = true;
        sway.enable = true;
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
        hyprpaper
        hyprlock
        fuzzel
        waybar
        playerctl
        pavucontrol
        brightnessctl
        grimblast
        networkmanagerapplet
        swaynotificationcenter
        waybar
        hyprpicker
    ] ++ [
        flameshot
        vicinae
    ];

}
