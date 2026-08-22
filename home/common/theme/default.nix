{ config, pkgs, ... }:

{
  home.pointerCursor = {
    enable = true;
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "Kanagawa";
      package = pkgs.kanagawa-icon-theme;
    };
    cursorTheme = {
      name = "phinger-cursors-dark";
      package = pkgs.phinger-cursors;
      size = 24;
    };
    gtk3.extraCss = ''
      @define-color accent_color #957fb8;
      @define-color accent_bg_color #957fb8;
      @define-color accent_fg_color #1f1f28;
      @define-color window_bg_color #1f1f28;
      @define-color window_fg_color #dcd7ba;
      @define-color view_bg_color #16161d;
      @define-color view_fg_color #dcd7ba;
      @define-color headerbar_bg_color #1f1f28;
      @define-color headerbar_fg_color #dcd7ba;
      @define-color headerbar_border_color #2a2a37;
      @define-color headerbar_backdrop_color #16161d;
      @define-color card_bg_color #2a2a37;
      @define-color card_fg_color #dcd7ba;
      @define-color card_border_color #363646;
      @define-color popover_bg_color #2a2a37;
      @define-color popover_fg_color #dcd7ba;
    '';
    gtk4.extraCss = ''
      @define-color accent_color #957fb8;
      @define-color accent_bg_color #957fb8;
      @define-color accent_fg_color #1f1f28;
      @define-color window_bg_color #1f1f28;
      @define-color window_fg_color #dcd7ba;
      @define-color view_bg_color #16161d;
      @define-color view_fg_color #dcd7ba;
      @define-color headerbar_bg_color #1f1f28;
      @define-color headerbar_fg_color #dcd7ba;
      @define-color headerbar_border_color #2a2a37;
      @define-color headerbar_backdrop_color #16161d;
      @define-color card_bg_color #2a2a37;
      @define-color card_fg_color #dcd7ba;
      @define-color card_border_color #363646;
      @define-color popover_bg_color #2a2a37;
      @define-color popover_fg_color #dcd7ba;
    '';
  };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style.name = "adwaita-dark";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-theme = "phinger-cursors-dark";
      cursor-size = 24;
      gtk-theme = "adw-gtk3-dark";
      icon-theme = "Kanagawa";
    };
  };
}
