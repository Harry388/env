{ self, ... }:

{

    flake.homeModules.default = {

        imports = [
            self.homeModules.spicetify
            self.homeModules.switchEnv
            self.homeModules.syncthing

            self.homeModules.waylandWM

            self.homeModules.apps
            self.homeModules.gaming
            self.homeModules.languages
            self.homeModules.tools
        ];

    };

}
