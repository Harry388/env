{ util, pkgs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "keyring";
} {

    services.gnome.gnome-keyring.enable = true;
    security.pam.services.sddm.enableGnomeKeyring = true;

}
