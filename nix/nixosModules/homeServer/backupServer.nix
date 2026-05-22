{

    flake.nixosModules.backupServer = { pkgs, config, lib, ... }:
    let
        cfg = config.backupServer;
        backupServerScript = pkgs.writeShellScriptBin "backup-server" (builtins.readFile ./backup-server);
    in
    {

        options.backupServer = {

            serviceUser = lib.mkOption {
                type = lib.types.str;
            };

        };

        config = {

            environment.systemPackages = [
                backupServerScript
            ];

            systemd.services.backup-server = {
                description = "Backup server folders";
                path = [
                    backupServerScript
                    pkgs.bash
                    pkgs.docker
                    pkgs.gnutar
                    pkgs.gzip
                ];
                serviceConfig = {
                    Type = "oneshot";
                    ExecStart = "backup-server --clean";
                    User = cfg.serviceUser;
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
