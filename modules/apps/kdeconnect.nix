{ util, pkgs, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "kdeconnect";
} {

    programs.kdeconnect.enable = true;

    environment.systemPackages = with pkgs; [
        kdePackages.qttools
    ];

}
