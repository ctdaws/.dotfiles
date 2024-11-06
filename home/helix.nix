{pkgs, ...}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = [
      pkgs.nil
      pkgs.taplo
    ];

    settings = {
      theme = "gruvbox";
      editor = {
        line-number = "relative";
        soft-wrap.enable = true;
        file-picker.hidden = false;
      };
      keys.insert = {
        j.j = "normal_mode";
      };
    };

    languages = {
      language = [{
        name = "toml";
        auto-format = true;
        formatter = {
          command = "taplo";
          args = ["fmt" "-"];
        };
      }];
    };
  };
}
