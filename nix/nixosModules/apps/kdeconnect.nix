{

    flake.nixosModules.kdeconnect = { pkgs, ... }: {

        programs.kdeconnect.enable = true;

        environment.systemPackages = with pkgs; [
            kdePackages.qttools
        ];

    };

}
