{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = builtins.concatStringsSep "" [
        "$os"
        "$username"
        "$directory"
        "$git_branch"
        "$git_status"
        "$c"
        "$rust"
        "$golang"
        "$nodejs"
        "$bun"
        "$python"
        "$nix_shell"
        "$time"
        "$cmd_duration"
        "$line_break"
        "$character"
      ];

      os = {
        disabled = false;
        symbols = {
          NixOS = " ";
          Linux = "󰌽 ";
          Windows = " ";
          Ubuntu = "󰕈 ";
          Arch = "󰣇 ";
          Debian = "󰣚 ";
          Fedora = "󰣛 ";
        };
        style = "bg:#957FB8 fg:#1F1F28";
        format = "[](fg:#957FB8)[$symbol]($style)";
      };

      username = {
        show_always = true;
        style_user = "bg:#957FB8 fg:#1F1F28";
        style_root = "bg:#E82424 fg:#1F1F28";
        format = "[$user ]($style)[](fg:#957FB8) ";
      };

      directory = {
        style = "bg:#7FB4CA fg:#1F1F28";
        format = "[](fg:#7FB4CA)[$path]($style)[](fg:#7FB4CA) ";
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
        symbol = " ";
        style = "bg:#E6C384 fg:#1F1F28";
        format = "[](fg:#E6C384)[$symbol$branch]($style)";
      };

      git_status = {
        style = "bg:#E6C384 fg:#1F1F28";
        format = "[$all_status$ahead_behind]($style)[](fg:#E6C384) ";
      };

      nodejs = {
        symbol = " ";
        style = "bg:#98BB6C fg:#1F1F28";
        format = "[](fg:#98BB6C)[$symbol$version]($style)[](fg:#98BB6C) ";
      };

      bun = {
        symbol = " ";
        style = "bg:#98BB6C fg:#1F1F28";
        format = "[](fg:#98BB6C)[$symbol$version]($style)[](fg:#98BB6C) ";
      };

      rust = {
        symbol = " ";
        style = "bg:#FFA066 fg:#1F1F28";
        format = "[](fg:#FFA066)[$symbol$version]($style)[](fg:#FFA066) ";
      };

      golang = {
        symbol = " ";
        style = "bg:#7AA89F fg:#1F1F28";
        format = "[](fg:#7AA89F)[$symbol$version]($style)[](fg:#7AA89F) ";
      };

      python = {
        symbol = " ";
        style = "bg:#E6C384 fg:#1F1F28";
        format = "[](fg:#E6C384)[$symbol$version]($style)[](fg:#E6C384) ";
      };

      nix_shell = {
        symbol = " ";
        style = "bg:#7E9CD8 fg:#1F1F28";
        format = "[](fg:#7E9CD8)[$symbol$state]($style)[](fg:#7E9CD8) ";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:#2A2A37 fg:#DCD7BA";
        format = "[](fg:#2A2A37)[ $time]($style)[](fg:#2A2A37) ";
      };

      cmd_duration = {
        show_milliseconds = true;
        format = "[ $duration](fg:#D27E99) ";
        disabled = false;
      };

      line_break = {
        disabled = false;
      };

      character = {
        disabled = false;
        success_symbol = "[❯](bold fg:#957FB8)";
        error_symbol = "[❯](bold fg:#E46876)";
        vimcmd_symbol = "[❮](bold fg:#98BB6C)";
      };
    };
  };
}
