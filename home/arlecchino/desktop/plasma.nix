{ config, pkgs, lib, ... }:

{
  home.activation.setPlasmaTheme = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    $DRY_RUN_CMD ${pkgs.kdePackages.plasma-workspace}/bin/plasma-apply-lookandfeel -a Catppuccin-Mocha-Mauve 2>/dev/null || true
    $DRY_RUN_CMD ${pkgs.kdePackages.plasma-workspace}/bin/plasma-apply-colorscheme CatppuccinMochaMauve 2>/dev/null || true
    $DRY_RUN_CMD ${pkgs.kdePackages.plasma-workspace}/bin/plasma-apply-cursortheme catppuccin-mocha-mauve-cursors 2>/dev/null || true
    $DRY_RUN_CMD ${pkgs.kdePackages.kconfig}/bin/kwriteconfig6 --file kdeglobals --group Icons --key Theme "Papirus-Dark" 2>/dev/null || true
    $DRY_RUN_CMD ${pkgs.kdePackages.kconfig}/bin/kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key theme "__aurorae__svg__CatppuccinMocha-Modern" 2>/dev/null || true
    $DRY_RUN_CMD ${pkgs.kdePackages.kconfig}/bin/kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key library "org.kde.kwin.aurorae" 2>/dev/null || true
    $DRY_RUN_CMD ${pkgs.kdePackages.kconfig}/bin/kwriteconfig6 --file kcminputrc --group Mouse --key PointerAccelerationProfile 1 2>/dev/null || true
    $DRY_RUN_CMD ${pkgs.kdePackages.kconfig}/bin/kwriteconfig6 --file kcminputrc --group Touchpad --key PointerAccelerationProfile 1 2>/dev/null || true
    $DRY_RUN_CMD ${pkgs.kdePackages.kconfig}/bin/kwriteconfig6 --file kcminputrc --group Touchpad --key PointerAcceleration 0.2 2>/dev/null || true
  '';
}
