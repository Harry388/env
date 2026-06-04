{ inputs, ... }:

{

    flake.nixosModules.tools = { pkgs, ... }: {

        environment.systemPackages = with pkgs; [
            tmux
            neovim
            luaPackages.tree-sitter-cli
            yazi
            air
            neocities
            fzf
            ripgrep
            pkg-config
            openssl
            fastfetch
            gnumake
            inotify-tools
            lazygit
            nmap
            udiskie
            colorz
            git-filter-repo
            git
            btop
            zoxide
            unzip
            tldr
            mdp
            gtypist
            bat
            starship
            jq
            tokei
            caddy
            go-task
            jujutsu
            smartmontools
            chafa
            ffmpeg
            opencode
            socat
            ascii
        ] ++ [
            inputs.session.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];

    };

}
