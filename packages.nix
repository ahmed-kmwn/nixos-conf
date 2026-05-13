{ pkgs, ... }:
{
  # ============================================================
  # System Packages
  # ============================================================
  environment.systemPackages = with pkgs; [

    #nixos tools
    nvd
    nix-tree
    nixpkgs-fmt
    nix-du
    comma

    # Audio
    pulseaudio
    pavucontrol

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
    wget
    aria2
    xclip
    fastfetch
    neovide
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
    joplin-desktop
    obsidian
    zathura
    #polymc

    # Media
    vlc
    yt-dlp

    # Desktop
    plank
    greybird
    papirus-icon-theme
    xfce.xfce4-xkb-plugin
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-screenshooter
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-notifyd
    xfce.xfce4-power-manager
    xfce.xfce4-battery-plugin
    xfce.xfce4-netload-plugin
    flameshot

    # Laptop
    brightnessctl

    # Containers & Tools
    nix-output-monitor

    # Browser
    google-chrome

    # Development — Rust
    rustc

    # Development — lean4
    lean4

    # Development — OCaml
    ocaml
    opam

    # Development — C
    gcc
    gnumake

    # Development — Haskell
    (haskell.packages.ghc9122.ghcWithPackages (ps: [ ]))
    haskell.packages.ghc9122.haskell-language-server
    haskell.packages.ghc9122.cabal-install
  ];
}
