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

    flake.homeModules.harry = {

        nixpkgs.config = {
            allowUnfree = true;
        };

        home.username = "harry";
        home.homeDirectory = "/home/harry";

        programs.home-manager.enable = true;

    };

}
