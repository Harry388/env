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

        quickshell = {
            url = "github:outfoxxed/quickshell";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        noctalia = {
            url = "github:noctalia-dev/noctalia-shell";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.quickshell.follows = "quickshell";
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
