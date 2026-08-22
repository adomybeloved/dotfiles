{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = builtins.concatStringsSep "" [
        "[](oniViolet)"
        "$os"
        "$username"
        "[](bg:crystalBlue fg:oniViolet)"
        "$directory"
        "[](bg:carpYellow fg:crystalBlue)"
        "$git_branch"
        "$git_status"
        "[](fg:carpYellow bg:springGreen)"
        "$c"
        "$rust"
        "$golang"
        "$nodejs"
        "$bun"
        "$php"
        "$java"
        "$kotlin"
        "$haskell"
        "$python"
        "$nix_shell"
        "[](fg:springGreen bg:waveAqua)"
        "$conda"
        "[](fg:waveAqua bg:oniViolet2)"
        "$time"
        "[ ](fg:oniViolet2)"
        "$cmd_duration"
        "$line_break"
        "$character"
      ];

      palette = "kanagawa";

      os = {
        disabled = false;
        style = "bg:oniViolet fg:sumiInk1";
        symbols = {
          NixOS = " ";
          Linux = "󰌽 ";
          Windows = " ";
          Ubuntu = "󰕈 ";
          Arch = "󰣇 ";
          Debian = "󰣚 ";
          Fedora = "󰣛 ";
        };
      };

      username = {
        show_always = true;
        style_user = "bg:oniViolet fg:sumiInk1";
        style_root = "bg:oniViolet fg:sumiInk1";
        format = "[ $user]($style)";
      };

      directory = {
        style = "bg:crystalBlue fg:sumiInk1";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = "󰝚 ";
          "Pictures" = " ";
          "Dotfiles" = "󱁤 Dotfiles";
        };
      };

      git_branch = {
        symbol = "";
        style = "bg:carpYellow";
        format = "[[ $symbol $branch ](fg:sumiInk1 bg:carpYellow)]($style)";
      };

      git_status = {
        style = "bg:carpYellow";
        format = "[[($all_status$ahead_behind )](fg:sumiInk1 bg:carpYellow)]($style)";
      };

      nodejs = {
        symbol = "";
        style = "bg:springGreen";
        format = "[[ $symbol( $version) ](fg:sumiInk1 bg:springGreen)]($style)";
      };

      bun = {
        symbol = "";
        style = "bg:springGreen";
        format = "[[ $symbol( $version) ](fg:sumiInk1 bg:springGreen)]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:springGreen";
        format = "[[ $symbol( $version) ](fg:sumiInk1 bg:springGreen)]($style)";
      };

      golang = {
        symbol = "";
        style = "bg:springGreen";
        format = "[[ $symbol( $version) ](fg:sumiInk1 bg:springGreen)]($style)";
      };

      python = {
        symbol = "";
        style = "bg:springGreen";
        format = "[[ $symbol( $version) ](fg:sumiInk1 bg:springGreen)]($style)";
      };

      nix_shell = {
        symbol = "";
        style = "bg:springGreen";
        format = "[[ $symbol( $state) ](fg:sumiInk1 bg:springGreen)]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:oniViolet2";
        format = "[[  $time ](fg:sumiInk1 bg:oniViolet2)]($style)";
      };

      line_break = {
        disabled = false;
      };

      character = {
        disabled = false;
        success_symbol = "[❯](bold fg:oniViolet)";
        error_symbol = "[❯](bold fg:waveRed)";
        vimcmd_symbol = "[❮](bold fg:springGreen)";
      };

      cmd_duration = {
        show_milliseconds = true;
        format = " in $duration ";
        style = "fg:oniViolet";
        disabled = false;
      };

      palettes.kanagawa = {
        sumiInk0 = "#16161D";
        sumiInk1 = "#1F1F28";
        sumiInk2 = "#2A2A37";
        sumiInk3 = "#363646";
        sumiInk4 = "#54546D";
        fujiWhite = "#DCD7BA";
        fujiGray = "#727169";
        oniViolet = "#957FB8";
        oniViolet2 = "#B8B4D0";
        crystalBlue = "#7E9CD8";
        springBlue = "#7FB4CA";
        waveAqua = "#7AA89F";
        springGreen = "#98BB6C";
        boatYellow = "#C0A36E";
        carpYellow = "#E6C384";
        surimiOrange = "#FFA066";
        waveRed = "#E46876";
        samuraiRed = "#E82424";
        sakuraPink = "#D27E99";
      };
    };
  };
}
