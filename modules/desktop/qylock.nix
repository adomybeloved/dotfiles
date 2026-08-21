{ config, pkgs, inputs, ... }:

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

  qmlPath = "${pkgs.qt6.qt5compat}/lib/qt-6/qml:${pkgs.qt6.qtdeclarative}/lib/qt-6/qml:${pkgs.qt6.qtmultimedia}/lib/qt-6/qml:${pkgs.qt6.qtsvg}/lib/qt-6/qml:${pkgs.quickshell}/lib/qt-6/qml";

  qtPluginPath = "${pkgs.qt6.qtmultimedia}/lib/qt-6/plugins:${pkgs.qt6.qtbase}/lib/qt-6/plugins:${pkgs.qt6.qtwayland}/lib/qt-6/plugins";

  qylockPkg = pkgs.stdenvNoCC.mkDerivation {
    pname = "qylock-quickshell";
    version = "unstable";
    src = inputs.qylock;
    nativeBuildInputs = [ pkgs.makeWrapper ];
    dontBuild = true;
    installPhase = ''
      runHook preInstall
      mkdir -p $out/share/qylock
      cp -r quickshell-lockscreen/. $out/share/qylock/
      cp -r themes $out/share/qylock/themes

      mkdir -p $out/bin
      makeWrapper $out/share/qylock/lock.sh $out/bin/qylock-lock \
        --set-default QS_THEME "R1999_2" \
        --set QYLOCK_THEMES_ROOT "$out/share/qylock/themes" \
        --set XDG_SESSION_TYPE "wayland" \
        --set QT_QPA_PLATFORM "wayland" \
        --suffix QML2_IMPORT_PATH : "${qmlPath}" \
        --suffix QML_IMPORT_PATH : "${qmlPath}" \
        --suffix QT_PLUGIN_PATH : "${qtPluginPath}" \
        --suffix GST_PLUGIN_SYSTEM_PATH_1_0 : "${gstPluginPath}" \
        --prefix PATH : ${pkgs.lib.makeBinPath [
          pkgs.quickshell
          pkgs.psmisc
          pkgs.systemd
          pkgs.coreutils
        ]}

      substituteInPlace $out/share/qylock/lock.sh \
        --replace-fail \
          'CONFIG_FILE="$HOME/.config/qylock/theme"
if [ -n "$1" ]; then
    export QS_THEME="$1"
elif [ -f "$CONFIG_FILE" ]; then
    export QS_THEME=$(cat "$CONFIG_FILE")
else
    export QS_THEME="nier-automata"
fi' \
          'if [ -n "$1" ]; then export QS_THEME="$1"; fi' \
        --replace-fail \
          'if [ -d "$DIR/../themes" ] && [ ! -d "$DIR/themes_link" ]; then
    export QS_THEME_PATH="$DIR/../themes/$QS_THEME"
else
    export QS_THEME_PATH="$DIR/themes_link/$QS_THEME"
fi' \
          'export QS_THEME_PATH="$QYLOCK_THEMES_ROOT/$QS_THEME"'

      runHook postInstall
    '';
  };
in
{
  programs.qylock = {
    enable = true;
    theme = "R1999_2";
    sddm.enable = true;
    quickshell.enable = false;
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
  };

  environment.systemPackages = [
    qylockPkg
    pkgs.ffmpeg
  ] ++ gstPlugins;
}
