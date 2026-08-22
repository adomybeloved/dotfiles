{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Aleksandra Mironova";
        email = "51828284+adomybeloved@users.noreply.github.com";
        signingKey = "~/.ssh/id_ed25519.pub";
      };
      commit.gpgsign = true;
      gpg.format = "ssh";
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

  home.packages = with pkgs; [
    gh
    sops
    age
    ssh-to-age
  ];
}
