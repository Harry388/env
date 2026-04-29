{

    flake.homeModules.languages = { pkgs, ... }: {

        home.packages = with pkgs; [
            cargo
            cargo-shuttle
            go
            templ
            gleam
            zig_0_15
            mysql84
            typescript
            typescript-language-server
            nodejs_22
            bun
            jdk
            erlang_27
            gcc
            rebar3
            elixir
            # deno
            python314
            php
            php83Packages.composer
            laravel
            lua

            rust-analyzer
            rustc
            gopls
            vtsls
            vue-language-server
            tailwindcss-language-server
            superhtml
            emmet-ls
            zls
            elixir-ls
            bash-language-server
            fish-lsp
            intelephense
        ];
        
    };

}
