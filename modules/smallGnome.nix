{ util, pkgs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "smallGnome";
} {

    services.displayManager.sddm = {
        enable = true;
        package = pkgs.kdePackages.sddm;
        wayland.enable = true;
        theme = "sddm-astronaut-theme";
        extraPackages = with pkgs; [
            sddm-astronaut
        ];
    };

    services.gnome.gnome-keyring.enable = true;
    services.gvfs.enable = true;

    security.pam.services.sddm.enableGnomeKeyring = true;

}
