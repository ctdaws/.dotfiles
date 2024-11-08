{ ... }: {
  xdg.configFile."zellij/config.kdl".source = ./config.kdl;
  xdg.configFile."zellij/layouts/chris_dev.kdl".source = ./layouts/chris_dev.kdl;

  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
  };
}
