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
    
    programs.dankMaterialShell = {
        enable = true;
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
    ] ++ [
        flameshot
        inputs.vicinae.packages.${pkgs.system}.default
            #inputs.matugen.packages.${pkgs.system}.default
    ];

}
