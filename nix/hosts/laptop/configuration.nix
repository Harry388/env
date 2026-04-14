{ inputs, self, ... }:

{

    flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.nixosModules.laptop
        ];
    };

    flake.nixosModules.laptop = {

        home-manager = {
            extraSpecialArgs = { inherit inputs; };
            users.harry = { ... }: {
                imports = [
                    self.homeModules.harry

                    self.homeModules.default
                ];
                home.stateVersion = "23.11"; # Don't change
            };
        };

        imports = [
            self.nixosModules.harry

            self.nixosModules.default
            self.nixosModules.battery
        ];

        boot.loader = {
            efi.canTouchEfiVariables = true;
            systemd-boot.enable = true;
        };

        # This value determines the NixOS release from which the default
        # settings for stateful data, like file locations and database versions
        # on your system were taken. It‘s perfectly fine and recommended to leave
        # this value at the release version of the first install of this system.
        # Before changing this value read the documentation for this option
        # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
        system.stateVersion = "23.05"; # Did you read the comment?

    };

}
