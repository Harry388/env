{ util, inputs, pkgs, config, ... }@confInps: let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in util.mkModule {
    inherit confInps;
    name = "spicetify";
    imports = [
        inputs.spicetify-nix.homeManagerModules.default
    ];
} {

    programs.spicetify = {
        enable = true;
        theme = spicePkgs.themes.text;
    };

}
