{
    description = "Nixos config flake";

    inputs = {
        # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs.url = "github:nixos/nixpkgs/d733bdc3007fe767f912f18b05651369539dc368";

        nixpkgs-13_03_2026.url = "github:nixos/nixpkgs/fe416aaedd397cacb33a610b33d60ff2b431b127";

        nixpkgs-27_04_2026.url = "github:nixos/nixpkgs/1c3fe55ad329cbcb28471bb30f05c9827f724c76";

        import-tree.url = "github:vic/import-tree";

        flake-parts.url = "github:hercules-ci/flake-parts";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        zen-browser = {
            url = "github:0xc000022070/zen-browser-flake";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        noctalia-qs = {
            url = "github:noctalia-dev/noctalia-qs";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        noctalia = {
            url = "github:noctalia-dev/noctalia-shell";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.noctalia-qs.follows = "noctalia-qs";
        };

        xwaylandSatellite = {
            url = "github:Supreeeme/xwayland-satellite";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        wooz = {
            url = "github:negrel/wooz";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        spicetify-nix = {
            url = "github:Gerg-L/spicetify-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
        imports = [
            (inputs.import-tree ./nix)
            inputs.home-manager.flakeModules.home-manager
        ];
    };
}
