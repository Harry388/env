{ util, pkgs, inputs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "gaming";
} {

    home.packages = with pkgs; [
        vesktop
        prismlauncher
        dolphin-emu
        clonehero
        azahar
        olympus
        rpcs3
    ];

}
