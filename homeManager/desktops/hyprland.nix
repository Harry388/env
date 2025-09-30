{ util, pkgs, inputs, ... }@confInps: let
    flameshot = pkgs.flameshot.override {
        enableWlrSupport = true;
    };
in util.mkModule {
    inherit confInps;
    name = "hyprlandHome";
    imports = [
        inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    ];
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
    
    programs.dankMaterialShell.enable = true;

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
        wayvnc
        wl-clipboard
        wtype
        material-symbols
    ] ++ [
        flameshot
        inputs.vicinae.packages.${pkgs.system}.default
    ];

}
