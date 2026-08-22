{ config, pkgs, ... }:

{
  imports = [
    ./starship.nix
    ./tools.nix
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    historySubstringSearch.enable = true;

    history = {
      size = 10000;
      save = 10000;
      share = true;
      ignoreDups = true;
    };

    shellAliases = {
      ls = "eza --icons";
      ll = "eza -l --icons --git";
      la = "eza -la --icons --git";
      lt = "eza --tree --level=2 --icons";
      cat = "bat --paging=never";
      grep = "rg";
      find = "fd";
      top = "btop";
      lg = "lazygit";
      ld = "lazydocker";
      dco = "docker compose";
      ff = "fastfetch";
      py = "python3";
      nswitch = "sudo nixos-rebuild switch --flake ~/Dotfiles#laptop";
      ntest = "nixos-rebuild dry-build --flake ~/Dotfiles#laptop";
    };

    initContent = ''
      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down
      bindkey "$terminfo[kcuu1]" history-substring-search-up
      bindkey "$terminfo[kcud1]" history-substring-search-down
      if [[ -o interactive ]] && [[ -z "$FASTFETCH_SHOWN" ]] && [[ "$SHLVL" -eq 1 ]]; then
        export FASTFETCH_SHOWN=1
        fastfetch
      fi
    '';
  };
}
