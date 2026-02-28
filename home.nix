{ pkgs, ... }:
{
  home.username = "vishwas";
  home.homeDirectory = "/home/vishwas";

  home.stateVersion = "25.05";

  news.display = "silent";

  targets.genericLinux.enable = true;
  targets.genericLinux.gpu.enable = false;

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  home.packages = with pkgs; [
    gh
    opencode
    btop
    bun
    nodejs
    tailscale
    dust
  ];

  programs.fish = {
    enable = true;
    shellAbbrs = {
      oc = "opencode";
      hms = "home-manager switch --flake ~/nix-config#vishwas";
      ngc = "nix-collect-garbage -d";
      cat = "bat";
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    nix-direnv.enable = true;
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    icons = "auto";
  };

  programs.bat = {
    enable = true;
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "Vishwas Parpattegar";
      user.email = "vishwasparpattegar@gmail.com";
      init.defaultBranch = "main";
      pull.rebase = true;
      rebase.autoStash = true;
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      userSettings = {
        "terminal.integrated.profiles.linux" = {
          "fish" = {
            path = "${pkgs.fish}/bin/fish";
          };
        };
        "terminal.integrated.defaultProfile.linux" = "fish";
      };
    };
  };

  programs.home-manager.enable = true;
}
