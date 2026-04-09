{ pkgs, ... }:

{
  # ============================================================
  # Users
  # ============================================================

  users.users.ahmed = {
    isNormalUser = true;
    description = "AHMED";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    shell = pkgs.zsh;

    packages = [ ];
  };

  # ============================================================
  # shell
  # ============================================================

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  # ============================================================
  # Locale & Time
  # ============================================================

  time.timeZone = "Africa/Cairo";
  i18n.defaultLocale = "en_US.UTF-8";

  # ============================================================
  # Networking
  # ============================================================

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  services.cloudflare-warp.enable = true;

  # ============================================================
  # Programs & Services
  # ============================================================

  programs.fzf.fuzzyCompletion = true;
  programs.firefox.enable = false;
  programs.mtr.enable = true;
  programs.dconf.enable = true;

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  services.gvfs.enable = true;
  services.gvfs.package = pkgs.gvfs;
  services.tumbler.enable = true;
  virtualisation.podman.enable = true;

  # ============================================================
  # Nix Settings
  # ============================================================

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.auto-optimise-store = true;

  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 7d";

  nixpkgs.config.allowUnfree = true;

  # ============================================================
  # Boot
  # ============================================================

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.efi.canTouchEfiVariables = true;

  # ============================================================
  # Audio
  # ============================================================

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # ============================================================
  # Fonts
  # ============================================================

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
  ];

  # ============================================================
  # Hardware
  # ============================================================

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.libinput = {
    enable = true;
    touchpad = {
      tapping = true;
      naturalScrolling = true;
      middleEmulation = true;
    };
  };

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  # ============================================================
  # Power Management
  # ============================================================

  services.power-profiles-daemon.enable = false;

  services.tlp = {
    enable = true;
    settings = {
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      CPU_HWP_DYN_BOOST_ON_AC = 1;
      CPU_HWP_DYN_BOOST_ON_BAT = 0;

      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "balance_power";

      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "balance_power";

      PCIE_ASPM_ON_AC = "performance";
      PCIE_ASPM_ON_BAT = "balance_power";

    };
  };

  # ============================================================
  # Security
  # ============================================================

  security.polkit.enable = true;

}
