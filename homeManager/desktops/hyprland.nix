{ util, pkgs, inputs, ... }@confInps: let
    flameshot = pkgs.flameshot.override {
        enableWlrSupport = true;
    };
in util.mkModule {
    inherit confInps;
    name = "hyprlandHome";
} {

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
    ] ++ [
        flameshot
        inputs.vicinae.packages.${pkgs.system}.default
        inputs.noctalia.packages.${pkgs.system}.default
    ];

}
