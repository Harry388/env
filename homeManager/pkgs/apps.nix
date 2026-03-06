{ util, pkgs, inputs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "apps";
} {

    programs.google-chrome.enable = true;

    programs.ghostty = {
        enable = true;
        systemd.enable = true;
    };

    environment.extraInit = ''
      export XDG_DATA_DIRS="$XDG_DATA_DIRS:${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
    '';

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
        weylus
        xournalpp
    ] ++ [
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
}
