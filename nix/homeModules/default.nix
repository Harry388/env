{ self, ... }:

{

    flake.homeModules.default = {

        imports = [
            self.homeModules.waylandWM

            self.homeModules.apps
            self.homeModules.gaming
            self.homeModules.languages
            self.homeModules.tools
        ];

    };

}
