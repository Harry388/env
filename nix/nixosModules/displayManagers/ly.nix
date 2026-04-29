{

    flake.nixosModules.ly = {

        services.displayManager.ly = {
            enable = true;
            settings = {
                bigclock = "en";
            };
        };

    };

}
