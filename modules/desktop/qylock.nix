{ config, pkgs, ... }:

let
  gstPlugins = with pkgs.gst_all_1; [
    gstreamer
    gst-plugins-base
    gst-plugins-good
    gst-plugins-bad
    gst-plugins-ugly
    gst-libav
  ];

  gstPluginPath = pkgs.lib.makeSearchPathOutput "lib" "lib/gstreamer-1.0" gstPlugins;

  qtPluginPath = pkgs.lib.makeSearchPathOutput "lib" "lib/qt-6/plugins" [
    pkgs.qt6.qtbase
    pkgs.qt6.qtdeclarative
    pkgs.qt6.qtmultimedia
    pkgs.qt6.qtwayland
    pkgs.qt6.qtsvg
  ];

  qmlImportPath = pkgs.lib.makeSearchPathOutput "lib" "lib/qt-6/qml" [
    pkgs.qt6.qtdeclarative
    pkgs.qt6.qt5compat
    pkgs.qt6.qtmultimedia
    pkgs.qt6.qtsvg
    pkgs.quickshell
  ];

  qylockLockWrapped = pkgs.writeShellScriptBin "qylock-lock" ''
    export GST_PLUGIN_SYSTEM_PATH_1_0="${gstPluginPath}"
    export QT_PLUGIN_PATH="${qtPluginPath}''${QT_PLUGIN_PATH:+:$QT_PLUGIN_PATH}"
    export QML_IMPORT_PATH="${qmlImportPath}''${QML_IMPORT_PATH:+:$QML_IMPORT_PATH}"
    export QML2_IMPORT_PATH="${qmlImportPath}''${QML2_IMPORT_PATH:+:$QML2_IMPORT_PATH}"
    export XDG_SESSION_TYPE="wayland"
    export QT_QPA_PLATFORM="wayland"
    export QS_THEME="''${1:-R1999_2}"
    exec /run/current-system/sw/bin/.qylock-lock-wrapped "$@" 2>/dev/null || exec quickshell -p /run/current-system/sw/share/qylock/lock_shell.qml
  '';
in
{
  programs.qylock = {
    enable = true;
    theme = "R1999_2";
    sddm.enable = true;
    quickshell.enable = true;
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    extraPackages = with pkgs; [
      gst_all_1.gstreamer
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-ugly
      gst_all_1.gst-libav
      qt6.qtmultimedia
      qt6.qt5compat
      qt6.qtsvg
    ];
  };

  environment.sessionVariables = {
    GST_PLUGIN_SYSTEM_PATH_1_0 = "${gstPluginPath}";
    QT_PLUGIN_PATH = "${qtPluginPath}";
    QML2_IMPORT_PATH = "${qmlImportPath}";
    QML_IMPORT_PATH = "${qmlImportPath}";
  };

  environment.systemPackages = [
    qylockLockWrapped
    pkgs.quickshell
    pkgs.ffmpeg
  ] ++ gstPlugins;
}
