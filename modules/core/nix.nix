{ config, pkgs, ... }:

{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
    builders-use-substitutes = true;
    warn-dirty = false;
    trusted-users = [ "root" "@wheel" ];
    max-jobs = "auto";
    cores = 0;
  };

  nix.daemonCPUSchedPolicy = "idle";
  nix.daemonIOSchedPriority = 7;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  nixpkgs.config.allowUnfree = true;
}
