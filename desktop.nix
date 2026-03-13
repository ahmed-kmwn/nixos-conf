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

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet -t -r --remember-session";
        user = "greeter";
      };
    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "null";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };

  # ============================================================
  # Environment Variables (System-wide)
  # ============================================================

  environment.variables = {
    GTK_THEME = "Adwaita:dark";
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };

  # ============================================================
  # System Auto-Upgrade
  # ============================================================

  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "weekly";
}
