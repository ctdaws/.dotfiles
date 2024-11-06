{ ... }: {
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };

    brews = [];

    casks = [
      "arc"
    ];

    masApps = {};
  };
}
