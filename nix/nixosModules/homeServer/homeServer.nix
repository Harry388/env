{ self, ... }:

{

    flake.nixosModules.homeServer = { pkgs, config, lib, ... }:
    let
        cfg = config.homeServer;
        homeServerScript = pkgs.writeShellScriptBin "home-server" (builtins.readFile ./home-server);
        homeServerBin = "${homeServerScript}/bin/home-server";
    in
    {

        imports = [
            self.nixosModules.syncthing
        ];

        options.homeServer = {

            user = lib.mkOption {
                type = lib.types.str;
            };

        };

        config = {

            services.syncthing.user = cfg.user;

            environment.systemPackages = [
                homeServerScript
            ];

            virtualisation.docker.enable = true;

            systemd.services.backup-server = {
                description = "Backup server folders";
                path = [
                    pkgs.bash
                    pkgs.docker
                    pkgs.gnutar
                    pkgs.gzip
                ];
                serviceConfig = {
                    Type = "oneshot";
                    ExecStart = "${pkgs.bash}/bin/bash -c '${homeServerBin} backup && ${homeServerBin} clean 2'";
                    User = cfg.user;
                };
            };

            systemd.timers.backup-server = {
                description = "Backup server folders on a timer";
                wantedBy = ["timers.target"];
                timerConfig = {
                    Unit = "backup-server.service";
                    OnCalendar = "Mon *-*-* 04:00:00";
                };
            };

        };

    };

}
