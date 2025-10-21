{
    description = "Nixos config flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        zen-browser = {
            url = "github:0xc000022070/zen-browser-flake";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        silentSDDM = {
            url = "github:uiriansan/SilentSDDM";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        vicinae = {
            url = "github:vicinaehq/vicinae";
        };

        dgop = {
            url = "github:AvengeMedia/dgop";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        dms-cli = {
            url = "github:AvengeMedia/danklinux";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        dankMaterialShell = {
            url = "github:AvengeMedia/DankMaterialShell";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.dgop.follows = "dgop";
            inputs.dms-cli.follows = "dms-cli";
        };
    };

    outputs = inputs:
    let
        util = import ./util.nix { inherit inputs; };
    in
    with util; {
        nixosConfigurations = {
            laptop = mkSystem "laptop";
            oldlaptop = mkSystem "oldlaptop";
            desktop = mkSystem "desktop";
            pi = mkSystem "pi";
        };
    };
}
