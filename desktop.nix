{ epkgs, ... }:

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

  services.displayManager.ly.enable = true;

  # ============================================================
  # System Auto-Upgrade
  # ============================================================

  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "weekly";
}
