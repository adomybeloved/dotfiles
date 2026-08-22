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

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";
  };

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "kanagawa";
      theme_background = false;
      vim_keys = true;
    };
  };

  xdg.configFile."btop/themes/kanagawa.theme".text = ''
    theme[main_bg]="#1F1F28"
    theme[main_fg]="#DCD7BA"
    theme[title]="#DCD7BA"
    theme[hi_fg]="#7E9CD8"
    theme[selected_bg]="#2A2A37"
    theme[selected_fg]="#957FB8"
    theme[inactive_fg]="#727169"
    theme[proc_misc]="#957FB8"
    theme[cpu_box]="#957FB8"
    theme[mem_box]="#7E9CD8"
    theme[net_box]="#7AA89F"
    theme[proc_box]="#E6C384"
    theme[div_line]="#363646"
    theme[temp_start]="#98BB6C"
    theme[temp_mid]="#E6C384"
    theme[temp_end]="#E46876"
    theme[cpu_start]="#7E9CD8"
    theme[cpu_mid]="#957FB8"
    theme[cpu_end]="#E46876"
    theme[free_start]="#98BB6C"
    theme[free_mid]="#7AA89F"
    theme[free_end]="#7E9CD8"
    theme[cached_start]="#7AA89F"
    theme[cached_mid]="#957FB8"
    theme[cached_end]="#D27E99"
    theme[available_start]="#E6C384"
    theme[available_mid]="#FFA066"
    theme[available_end]="#E46876"
    theme[used_start]="#957FB8"
    theme[used_mid]="#D27E99"
    theme[used_end]="#E46876"
    theme[download_start]="#7AA89F"
    theme[download_mid]="#7E9CD8"
    theme[download_end]="#957FB8"
    theme[upload_start]="#E6C384"
    theme[upload_mid]="#FFA066"
    theme[upload_end]="#E46876"
  '';

  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        theme = {
          activeBorderColor = [ "#957FB8" "bold" ];
          inactiveBorderColor = [ "#2A2A37" ];
          optionsTextColor = [ "#7E9CD8" ];
          selectedLineBgColor = [ "#2A2A37" ];
          selectedRangeBgColor = [ "#2A2A37" ];
          cherryPickedCommitBgColor = [ "#7AA89F" ];
          cherryPickedCommitFgColor = [ "#1F1F28" ];
          unstagedChangesColor = [ "#E46876" ];
          defaultFgColor = [ "#DCD7BA" ];
        };
      };
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  xdg.configFile."fastfetch/config.jsonc".text = ''
    {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "logo": {
        "type": "small",
        "padding": {
          "top": 1,
          "left": 2,
          "right": 3
        }
      },
      "display": {
        "separator": " 󰄾 "
      },
      "modules": [
        "title",
        "separator",
        {
          "type": "os",
          "key": "󱄅 OS",
          "keyColor": "magenta"
        },
        {
          "type": "host",
          "key": "󰌢 Host",
          "keyColor": "blue"
        },
        {
          "type": "kernel",
          "key": "󰌽 Kernel",
          "keyColor": "cyan"
        },
        {
          "type": "uptime",
          "key": "󰅐 Uptime",
          "keyColor": "green"
        },
        {
          "type": "wm",
          "key": "󱂬 WM",
          "keyColor": "yellow"
        },
        {
          "type": "terminal",
          "key": " Terminal",
          "keyColor": "magenta"
        },
        {
          "type": "shell",
          "key": "󰞷 Shell",
          "keyColor": "blue"
        },
        {
          "type": "cpu",
          "key": "󰍛 CPU",
          "keyColor": "cyan"
        },
        {
          "type": "gpu",
          "key": "󰢮 GPU",
          "keyColor": "green"
        },
        {
          "type": "memory",
          "key": "󰑭 Memory",
          "keyColor": "yellow"
        },
        {
          "type": "battery",
          "key": "󰂁 Battery",
          "keyColor": "green"
        },
        "break",
        "colors"
      ]
    }
  '';

  home.packages = with pkgs; [
    ripgrep
    fd
    fastfetch
    jq
  ];
}
