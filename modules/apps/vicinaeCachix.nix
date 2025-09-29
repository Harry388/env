{ util, pkgs, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "vicinaeCachix";
} {

    nix.settings = {
        substituters = [ "https://vicinae.cachix.org" ];
        trusted-substituters = [ "https://vicinae.cachix.org" ];
        trusted-public-keys = [ "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc=" ];
    };

}
