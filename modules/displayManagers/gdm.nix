{ util, lib, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "gdm";
} {

    services.displayManager.gdm = {
        enable = true;
        wayland = true;
        autoSuspend = false;
    };

}
