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
      desktop_widgets = {
        enabled = false;
      };
      bar = {
        default = {
          position = "top";
          thickness = 34;
          padding = 12;
          widget_spacing = 8;
          radius = 12;
          background_opacity = 0.92;
          start = [
            "launcher"
            "workspaces"
          ];
          center = [
            "clock"
          ];
          end = [
            "media"
            "tray"
            "notifications"
            "volume"
            "brightness"
            "battery"
            "control-center"
          ];
        };
      };
    };
  };
}
