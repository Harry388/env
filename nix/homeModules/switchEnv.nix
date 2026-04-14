{

    flake.homeModules.switchEnv = { pkgs, ... }: {

        home.packages = with pkgs; [
            (writeShellScriptBin "switch-env" (builtins.readFile ../../environment/scripts/switch-env))
        ];

    };

}

