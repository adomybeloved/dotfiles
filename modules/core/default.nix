{ config, pkgs, ... }:

{
  imports = [
    ./nix.nix
    ./boot.nix
    ./security.nix
    ./network.nix
    ./sound.nix
    ./locale.nix
    ./users.nix
    ./packages.nix
  ];

  system.stateVersion = "26.05";
}
