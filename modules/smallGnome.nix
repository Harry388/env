{ util, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "smallGnome";
} {

    services.xserver = {
        enable = true;
    };

    services.displayManager.sddm.enable = true;

    services.gnome.gnome-keyring.enable = true;
    services.gvfs.enable = true;

    security.pam.services.sddm.enableGnomeKeyring = true;

}
