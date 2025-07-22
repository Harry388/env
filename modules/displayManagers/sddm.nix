{ util, pkgs, inputs, ... }@confInps: let
    sddm-theme = inputs.silentSDDM.packages.${pkgs.system}.default.override {
        theme = "default";
    };
in util.mkModule {
    inherit confInps;
    name = "sddm";
}  {

    qt.enable = true;

    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        package = pkgs.kdePackages.sddm;
        theme = sddm-theme.pname;
        extraPackages = sddm-theme.propagatedBuildInputs;
    };

    environment.systemPackages = [
        sddm-theme
        sddm-theme.test
    ];

}
