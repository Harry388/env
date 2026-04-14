{ inputs, ... }:

{

    flake.homeModules.apps = { pkgs, ... }: {

        programs.google-chrome.enable = true;

        programs.ghostty = {
            enable = true;
            systemd.enable = true;
        };

        home.packages = with pkgs; [
            alacritty
            sqlitebrowser
            # spotify
            obsidian
            postman
            zed-editor
            transmission_4-gtk
            qbittorrent
            libreoffice-qt
            hunspell
            hunspellDicts.en_GB-ise
            processing
            loupe
            gimp
            musescore
            firefox
            vlc
            nautilus
            gnome-calculator
            gnome-disk-utility
            file-roller
            seahorse
            gittyup
            bottles
            warehouse
            mysql-workbench
            xournalpp
            rpi-imager
        ] ++ [
            inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];

    };

}
