{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    protonup-qt
    protontricks
    mangohud
    steamtinkerlaunch
    gamescope
    wineWow64Packages.staging
    winetricks
  ];

  programs.mangohud = {
    enable = true;
    enableSessionWide = false;
    settings = {
      fps_limit = [ 0 144 60 ];
      toggle_fps_limit = "F1";
      toggle_hud = "Shift_R+F12";
      legacy_layout = false;
      gpu_stats = true;
      gpu_temp = true;
      gpu_core_clock = true;
      gpu_mem_clock = true;
      gpu_power = true;
      cpu_stats = true;
      cpu_temp = true;
      cpu_mhz = true;
      cpu_power = true;
      ram = true;
      vram = true;
      fps = true;
      frametime = true;
      frame_timing = 1;
      background_alpha = 0.6;
      background_color = "1F1F28";
      text_color = "DCD7BA";
      gpu_color = "7E9CD8";
      cpu_color = "957FB8";
      vram_color = "7AA89F";
      ram_color = "E6C384";
      engine_color = "98BB6C";
      frametime_color = "7AA89F";
      font_size = 20;
      round_corners = 8;
    };
  };
}
