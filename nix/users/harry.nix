{

    flake.nixosModules.harry = { pkgs, ... }: {

        users.users.harry = {
            isNormalUser = true;
            description = "Harry";
            extraGroups = [ "networkmanager" "wheel" "docker" ];
            shell = pkgs.fish;
        };

        programs.fish.enable = true;

    };

}
