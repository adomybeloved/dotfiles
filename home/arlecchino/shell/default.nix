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
      ff = "fastfetch";
      nswitch = "sudo nixos-rebuild switch --flake ~/Dotfiles#laptop";
      ntest = "nixos-rebuild dry-build --flake ~/Dotfiles#laptop";
    };

    initContent = ''
      fastfetch
    '';
  };
}
