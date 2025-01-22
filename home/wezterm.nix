{ pkgs, ... }: { 
  programs.wezterm = {
    enable = false;
    extraConfig = ''
      return {
        font_size = 19.0,
        color_scheme = "GruvboxDark",
        hide_tab_bar_if_only_one_tab = true,
      }
    '';
  };
}
