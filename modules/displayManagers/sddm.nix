{ util, pkgs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "sddm";
} {

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

    environment.systemPackages = with pkgs; [
        sddm-astronaut
    ];

}
