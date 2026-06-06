{ self, ... }:

{
    flake.nixosModules.default = {
        
        imports = [
            self.nixosModules.base
            self.nixosModules.flatpak
            self.nixosModules.fonts
            self.nixosModules.gvfs
            self.nixosModules.keyring
            self.nixosModules.tailscale
            self.nixosModules.homeManager
            self.nixosModules.switchEnv

            self.nixosModules.apps
            self.nixosModules.gaming
            self.nixosModules.languages
            self.nixosModules.tools

            self.nixosModules.niri
            self.nixosModules.waylandWMExtras

            self.nixosModules.ly

            self.nixosModules.syncthing
        ];

    };
}
