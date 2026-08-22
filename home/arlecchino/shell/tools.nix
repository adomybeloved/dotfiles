{ config, pkgs, ... }:

{
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    extraOptions = [
      "--group-directories-first"
      "--header"
    ];
  };

  programs.bat = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    colors = {
      bg = "#1F1F28";
      "bg+" = "#2A2A37";
      fg = "#DCD7BA";
      "fg+" = "#DCD7BA";
      hl = "#C34043";
      "hl+" = "#D27E99";
      info = "#957FB8";
      pointer = "#D27E99";
      marker = "#D27E99";
      prompt = "#957FB8";
      spinner = "#D27E99";
      header = "#7E9CD8";
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  home.packages = with pkgs; [
    ripgrep
    fd
    btop
    fastfetch
    lazygit
    jq
  ];
}
