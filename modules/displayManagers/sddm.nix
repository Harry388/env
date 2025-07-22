{ util, pkgs, ... }@confInps: let
    sddm-astronaut = pkgs.sddm-astronaut.override {
        embeddedTheme = "pixel_sakura";
    };
in util.mkModule {
    inherit confInps;
    name = "sddm";
}  {

    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        package = pkgs.kdePackages.sddm;
        theme = "sddm-astronaut-theme";
        extraPackages = with pkgs; [
            kdePackages.qtsvg
            kdePackages.qtmultimedia
            kdePackages.qtvirtualkeyboard
        ];
    };

    environment.systemPackages = [
        sddm-astronaut
    ];

}
