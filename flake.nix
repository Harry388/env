{
    description = "Nixos config flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        import-tree.url = "github:vic/import-tree";

        flake-parts.url = "github:hercules-ci/flake-parts";

        nixos-hardware.url = "github:nixos/nixos-hardware/master";

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
