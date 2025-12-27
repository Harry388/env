{ util, pkgs, inputs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "apps";
} {

    programs.google-chrome.enable = true;

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
        ghostty
        gittyup
        bottles
        warehouse
        mysql-workbench
        weylus
        xournalpp
    ] ++ [
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
}
