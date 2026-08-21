{ config, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
  };

  environment.systemPackages = with pkgs; [
    docker-compose
    lazydocker
  ];
}
