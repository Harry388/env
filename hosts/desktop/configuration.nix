{ inputs, util, pkgs, ... }:

{

    home-manager = {
        extraSpecialArgs = { inherit inputs util; };
        users.harry = util.mkUser "harry" {
            defaultHome.enable = true;
            home.stateVersion = "23.11"; # Don't change
        };
    };

    environment.extraInit = ''
      export XDG_DATA_DIRS="$XDG_DATA_DIRS:${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
    '';

    boot.loader = {
        efi.canTouchEfiVariables = true;
        systemd-boot.enable = true;
    };

    defaultModules.enable = true;

    memlock.enable = true;

    sunshine.enable = true;

    openssh.enable = true;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.05"; # Did you read the comment?

}
