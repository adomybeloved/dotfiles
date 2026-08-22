{ config, pkgs, inputs, ... }:

{
  programs.noctalia = {
    enable = true;
    package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
    customPalettes = {
      kanagawa = {
        name = "Kanagawa";
        background = "#1F1F28";
        foreground = "#DCD7BA";
        primary = "#957FB8";
        secondary = "#7E9CD8";
        accent = "#7AA89F";
        muted = "#727169";
        surface = "#2A2A37";
        border = "#363646";
      };
    };
    settings = {
      theme = {
        mode = "dark";
        source = "custom";
        custom = "kanagawa";
      };
    };
  };
}
