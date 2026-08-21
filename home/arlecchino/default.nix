{ config, pkgs, ... }:

{
  home.username = "arlecchino";
  home.homeDirectory = "/home/arlecchino";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    antigravity-ide
    kdePackages.kate
    firefox
    gh
    sops
    age
    ssh-to-age
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Aleksandra Mironova";
        email = "51828284+adomybeloved@users.noreply.github.com";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
    };
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*" = {
        addKeysToAgent = "yes";
      };
    };
  };

  services.ssh-agent.enable = true;
  programs.home-manager.enable = true;
}
