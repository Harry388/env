{ util, pkgs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "memlock";
} {

    security.pam.loginLimits = [
        { domain = "*"; item = "memlock"; type = "soft"; value = "unlimited"; }
        { domain = "*"; item = "memlock"; type = "hard"; value = "unlimited"; }
    ];

}
