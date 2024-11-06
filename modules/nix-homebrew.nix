{ username, ... }: {
  nix-homebrew = {
    enable = true;
    user = username;

    # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
    enableRosetta = true;
  };
  
}
