{ pkgs, ... }: {
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
    };

    brews = [];

    casks = [
      "arc"
      "obsidian"
      "steam"
      "qbittorrent"
      "zoom"
      # The following can be installed as
      # systemPackges, but that makes their
      # presence in the dock ugly and spotlight
      # kinda works with aliases but not too well.
      "alacritty"
      "discord"
      "slack"
      "vlc"
      "utm"
    ];

    masApps = {};
  };

  environment.systemPackages = [
    # This is where system packages would go
    # (e.g. alacritty), but I'm using brew for
    # these atm as mentioned above
    pkgs.aldente
    pkgs.rustup
  ];
}
