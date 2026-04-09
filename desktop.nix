{ pkgs, ... }:

{
  # ============================================================
  #Desktop
  # ============================================================

  services.xserver = {
    enable = true;
    desktopManager.xfce.enable = true;
    xkb = {
      layout = "us,ara";
      options = "grp:alt_shift_toggle";
    };
  };

  # ============================================================
  # Display Manager (Greeter)
  # ============================================================

  #  services.greetd = {
  #    enable = true;
  #    settings = {
  #      default_session = {
  #        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd '${pkgs.dbus}/bin/dbus-run-session startxfce4'";
  #        user = "greeter";
  #      };
  #    };
  #  };
  #
  #  systemd.services.greetd.serviceConfig = {
  #    Type = "idle";
  #    StandardInput = "tty";
  #    StandardOutput = "tty";
  #    StandardError = "journal";
  #    TTYReset = true;
  #    TTYVHangup = true;
  #    TTYVTDisallocate = true;
  #  };
  #  users.users.greeter.extraGroups = [
  #    "video"
  #    "input"
  #  ];
  services.displayManager.ly.enable = true;

  # ============================================================
  # System Auto-Upgrade
  # ============================================================

  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "weekly";
}
