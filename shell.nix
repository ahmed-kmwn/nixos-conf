{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    initContent = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
      export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
      source ${pkgs.fzf}/share/fzf/key-bindings.zsh
      source ${pkgs.fzf}/share/fzf/completion.zsh
      [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
      [[ ! -r '/home/ahmed/.opam/opam-init/init.zsh' ]] || source '/home/ahmed/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null

      eval "$(zoxide init zsh)"

      evim() {
        neovide "$@" > /dev/null 2>&1 &!
      }

      extract () {
        if [ -f "$1" ] ; then
          case "$1" in
            *.tar.bz2|*.tbz2) tar xjf "$1"    ;;
            *.tar.gz|*.tgz)   tar xzf "$1"    ;;
            *.tar.xz|*.txz)   tar xJf "$1"    ;;
            *.tar.zst)        tar --zstd -xf "$1" ;;
            *.tar)            tar xf "$1"      ;;
            *.bz2)            bunzip2 "$1"     ;;
            *.rar)            unrar x "$1"     ;;
            *.gz)             gunzip "$1"      ;;
            *.zip)            unzip "$1"       ;;
            *.7z)             7z x "$1"        ;;
            *.xz)             xz -d "$1"       ;;
            *.zst)            zstd -d "$1"     ;;
            *.lzma)           unlzma "$1"      ;;
            *.exe)            cabextract "$1"  ;;
            *.deb)            ar x "$1"        ;;
            *)                echo "'$1' cannot be extracted via extract()" ;;
          esac
        else
          echo "'$1' is not a valid file"
        fi
      }
    '';

    shellAliases = {
      nixo-up = "sudo nixos-rebuild switch --flake ~/nixos#nixos";
      iextract = "ouch decompress";
      start-lute = "distrobox enter mini-debian -- bash -c 'cd ~/lute_app && . .venv/bin/activate && LUTE_DATA=./data python3 -m lute.main'";
      bat = "batcat";
      du = "dust";
      fz = "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'";
      ls = "eza -l --icons --group-directories-first";
      download = "aria2c -x 16 -s 16 -c -d ~/Downloads --download-result=full --summary-interval=0";
      clean-nixos = "sudo nix-collect-garbage -d && nix-store --optimize";
    };
  };
}
