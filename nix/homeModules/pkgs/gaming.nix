{

    flake.homeModules.gaming = { pkgs, ... }: {

        home.packages = with pkgs; [
            vesktop
            prismlauncher
            dolphin-emu
            clonehero
            azahar
            olympus
            moonlight-qt
        ];

    };

}
