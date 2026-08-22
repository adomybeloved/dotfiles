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

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      line-numbers = true;
      side-by-side = false;
      syntax-theme = "base16-256";
      plus-style = "syntax #2B3328";
      plus-emph-style = "syntax #344030";
      minus-style = "syntax #43242B";
      minus-emph-style = "syntax #542B34";
      line-numbers-minus-style = "#E46876";
      line-numbers-plus-style = "#98BB6C";
      line-numbers-zero-style = "#727169";
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
