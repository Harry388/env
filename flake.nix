{
    description = "Nixos config flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        import-tree.url = "github:vic/import-tree";

        flake-parts.url = "github:hercules-ci/flake-parts";

        nixos-hardware.url = "github:nixos/nixos-hardware/master";

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

        session = {
            url = "github:harry388/session";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
        imports = [
            (inputs.import-tree ./nix)
        ];
    };
}
