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

        vicinae = {
            url = "github:vicinaehq/vicinae";
        };

        noctalia = {
            url = "github:noctalia-dev/noctalia-shell";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        xwaylandSatellite = {
            url = "github:Supreeeme/xwayland-satellite";
            inputs.nixpkgs.follows = "nixpkgs";
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
