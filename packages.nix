{ pkgs, ... }:
{
  # ============================================================
  # System Packages
  # ============================================================
  environment.systemPackages = with pkgs; [
    # Audio
    pulseaudio
    pavucontrol

    # Gaming
    polymc

    # Extract & Archive
    unzip
    unrar
    p7zip
    ouch
    xz
    zstd
    gnutar
    exfatprogs

    # Utilities
    vim
    wget
    aria2
    xclip
    fastfetch
    htop
    btop
    git
    fzf
    bat
    eza
    dust
    duf
    zoxide
    pstree
    httrack
    nmap
    calibre

    # Media
    vlc
    yt-dlp

    # Desktop
    plank
    papirus-icon-theme
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-screenshooter
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-notifyd
    xfce.xfce4-power-manager
    xfce.xfce4-battery-plugin
    xfce.xfce4-netload-plugin

    # Theming
    lxappearance
    qt6Packages.qt6ct
    adwaita-qt6

    # Laptop
    brightnessctl

    # Containers & Tools
    distrobox
    nix-output-monitor

    # Browser
    google-chrome

    # Network
    riseup-vpn

    # Development — Rust
    rustc

    # Development — OCaml
    ocaml
    opam

    # Development — C
    gcc
    gnumake

    # Development — Haskell
    haskell.compiler.native-bignum.ghc9103
    haskellPackages.haskell-language-server
    haskellPackages.cabal-install
    stack
  ];
}
