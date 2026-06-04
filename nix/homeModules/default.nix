{ self, ... }:

{

    flake.homeModules.default = {

        imports = [
            self.homeModules.waylandWM
        ];

    };

}
