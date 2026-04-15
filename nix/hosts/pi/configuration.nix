{ inputs, self, ... }:

{

    flake.nixosConfigurations.pi = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.nixosModules.pi
        ];
    };

    flake.nixosModules.pi = { lib, pkgs, ... }: {

        networking.hostName = "pi";

        home-manager = {
            extraSpecialArgs = { inherit inputs; };
            users.harry = { ... }: {
                imports = [
                    self.homeModules.harry

                    self.homeModules.switchEnv
                    self.homeModules.syncthing

                    self.homeModules.languages
                    self.homeModules.tools
                ];
                home.stateVersion = "23.11"; # Don't change
            };
        };

        imports = [
            self.nixosModules.harry

            self.nixosModules.base
            self.nixosModules.gvfs
            self.nixosModules.keyring
            self.nixosModules.tailscale
            self.nixosModules.homeManager
        ];

        boot = {
            kernelPackages = pkgs.linuxPackages_rpi4;
            tmp.useTmpfs = true;
            kernelParams = [
                "console=ttyS0,115200n8"
                "console=ttyAMA0,115200n8"
                "console=tty0"
            ];
            loader = {
                grub.enable = false;
                generic-extlinux-compatible.enable = true;
            };
        };

        hardware.enableRedistributableFirmware = true;
        powerManagement.cpuFreqGovernor = "ondemand";

        hardware.graphics.enable = lib.mkForce false;

        services.getty.autologinUser = "harry";

        # This value determines the NixOS release from which the default
        # settings for stateful data, like file locations and database versions
        # on your system were taken. It‘s perfectly fine and recommended to leave
        # this value at the release version of the first install of this system.
        # Before changing this value read the documentation for this option
        # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
        system.stateVersion = "24.11"; # Did you read the comment?

    };

}
