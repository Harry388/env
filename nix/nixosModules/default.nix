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

            self.nixosModules.kdeconnect
            self.nixosModules.steam
            self.nixosModules.vial

            self.nixosModules.niri

            self.nixosModules.ly
        ];

    };
}
