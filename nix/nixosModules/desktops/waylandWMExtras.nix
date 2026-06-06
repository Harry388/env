{ inputs, ... }:

{

    flake.nixosModules.waylandWMExtras = { pkgs, ... }: {

        environment.systemPackages = with pkgs; [
            fuzzel
            playerctl
            pavucontrol
            brightnessctl
            grimblast
            hyprpicker
            wayvnc
            wl-clipboard
            # wtype # not sure if this is needed
            networkmanagerapplet
            matugen
            vicinae
            waypipe
            weylus
            flameshot
        ] ++ [
            inputs.wooz.packages.${pkgs.stdenv.hostPlatform.system}.default
            inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];

    };

}
