{

    flake.nixosModules.backupServer = { pkgs, ... }: {

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
                ExecStart = "/home/harry/.local/scripts/backup-server --clean";
                User = "harry";
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

}
