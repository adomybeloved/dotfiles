{ config, pkgs, ... }:

{
  imports = [
    ./nix.nix
    ./boot.nix
    ./security.nix
    ./network.nix
    ./sound.nix
    ./locale.nix
    ./fonts.nix
    ./users.nix
    ./packages.nix
    ./docker.nix
  ];

  system.stateVersion = "26.05";
}
