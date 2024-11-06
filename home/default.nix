{ username, ... }:

{
  imports = [
    ./core.nix
    ./alacritty.nix
    ./helix.nix
    ./yazi.nix
    ./eza.nix
    ./jujutsu.nix
  ];

  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "24.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
