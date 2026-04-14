{ inputs, ... }:

{

    flake.nixosModules.homeManager = {

        imports = [
            inputs.home-manager.nixosModules.home-manager
        ];

    };

}
