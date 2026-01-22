{ util, pkgs, inputs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "gaming";
} {

    home.packages = with pkgs; [
        vesktop
        modrinth-app
        dolphin-emu
        clonehero
        azahar
        olympus
    ];

}
