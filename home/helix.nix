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

    themes = {
      # Copied from helix gruvbox theme and modified
      # to my preferences
      gruvbox = let
      bg0 = "#282828"; # main background
      bg0_s = "#32302f";
      bg1 = "#3c3836";
      bg2 = "#504945";
      bg3 = "#665c54";
      bg4 = "#7c6f64";
      fg0 = "#fbf1c7";
      fg1 = "#ebdbb2"; # main foreground
      fg2 = "#d5c4a1";
      fg3 = "#bdae93";
      fg4 = "#a89984";
      gray = "#928374";
      red0 = "#cc241d"; # neutral
      red1 = "#fb4934"; # bright
      green0 = "#98971a";
      green1 = "#b8bb26";
      yellow0 = "#d79921";
      yellow1 = "#fabd2f";
      blue0 = "#458588";
      blue1 = "#83a598";
      purple0 = "#b16286";
      purple1 = "#d3869b";
      aqua0 = "#689d6a";
      aqua1 = "#8ec07c";
      orange0 = "#d65d0e";
      orange1 = "#fe8019";
      in {
        "annotation" = { fg = fg1; };

        "attribute" = { fg = aqua1; };

        "comment" = { fg = gray; };

        "constant" = { fg = purple1; };
        "constant.character" = { fg = aqua1; };
        "constant.character.escape" = { fg = orange1; };
        "constant.macro" = { fg = aqua1; };
        "constructor" = { fg = purple1; };

        "definition" = { underline = { color = aqua1; }; };

        "diagnostic" = { underline = { color = orange1; style = "curl"; }; };
        "diagnostic.deprecated" = { modifiers = ["crossed_out"]; };
        "diagnostic.error" = { underline = { color = red1; style = "curl"; }; };
        "diagnostic.hint" = { underline = { color = blue1; style = "curl"; }; };
        "diagnostic.info" = { underline = { color = aqua1; style = "curl"; }; };
        "diagnostic.warning" = { underline = { color = yellow1; style = "curl"; }; };
        # "diagnostic.unnecessary" = { modifiers = ["dim"] }  # do not remove this for future resolving;

        "error" = { fg = red1; };
        "hint" = { fg = blue1; };
        "info" = { fg = aqua1; };
        "warning" = { fg = yellow1; };

        "diff.delta" = { fg = yellow1; };
        "diff.minus" = { fg = red1; };
        "diff.plus" = { fg = green1; };

        "function" = { fg = green1; };
        "function.builtin" = { fg = yellow1; };
        "function.macro" = { fg = blue1; };

        "keyword" = { fg = red1; };
        "keyword.control.import" = { fg = aqua1; };

        "label" = { fg = red1; };

        "markup.bold" = { modifiers = ["bold"]; };
        "markup.heading" = aqua1;
        "markup.italic" = { modifiers = ["italic"]; };
        "markup.link.text" = red1;
        "markup.link.url" = { fg = green1; modifiers = ["underlined"]; };
        "markup.raw" = red1;
        "markup.strikethrough" = { modifiers = ["crossed_out"]; };

        "module" = { fg = aqua1; };

        "namespace" = { fg = fg1; };

        "operator" = { fg = purple1; };

        "punctuation" = { fg = orange1; };

        "special" = { fg = purple0; };

        "string" = { fg = green1; };
        "string.regexp" = { fg = orange1; };
        "string.special" = { fg = orange1; };
        "string.symbol" = { fg = yellow1; };

        "tag" = { fg = aqua1; };

        "type" = { fg = yellow1; };
        # "type.enum.variant" = { modifiers = ["italic"]; };

        "ui.background" = { bg = bg0; };
        "ui.bufferline" = { fg = fg1; bg = bg1; };
        "ui.bufferline.active" = { fg = bg0; bg = yellow0; };
        "ui.bufferline.background" = { bg = bg2; };

        "ui.cursor" = { fg = bg1; bg = bg2; };
        "ui.cursor.insert" = { fg = bg1; bg = blue0; };
        "ui.cursor.normal" = { fg = bg1; bg = gray; };
        "ui.cursor.select" = { fg = bg1; bg = orange0; };
        "ui.cursor.match" = { fg = fg3; bg = bg3; };

        "ui.cursor.primary" = { bg = fg3; fg = bg1; };
        "ui.cursor.primary.insert" = { fg = bg1; bg = blue1; };
        "ui.cursor.primary.normal" = { fg = bg1; bg = fg3; };
        "ui.cursor.primary.select" = { fg = bg1; bg = orange1; };

        "ui.cursorline" = { bg = bg0_s; };
        "ui.cursorline.primary" = { bg = bg1; };

        "ui.help" = { bg = bg1; fg = fg1; };
        "ui.linenr" = { fg = bg3; };
        "ui.linenr.selected" = { fg = yellow1; };
        "ui.menu" = { fg = fg1; bg = bg2; };
        "ui.menu.selected" = { fg = bg2; bg = blue1; modifiers = ["bold"]; };
        "ui.popup" = { bg = bg1; };
        "ui.picker.header.column" = { underline.style = "line"; };
        "ui.picker.header.column.active" = { modifiers = ["bold"]; underline.style = "line"; };
        "ui.selection" = { bg = bg2; };
        "ui.selection.primary" = { bg = bg3; };

        "ui.statusline" = { fg = fg1; bg = bg2; };
        "ui.statusline.inactive" = { fg = fg4; bg = bg2; };
        "ui.statusline.insert" = { fg = bg1; bg = blue1; modifiers = ["bold"]; };
        "ui.statusline.normal" = { fg = bg1; bg = fg3; modifiers = ["bold"]; };
        "ui.statusline.select" = { fg = bg1; bg = orange1; modifiers = ["bold"]; };

        "ui.text" = { fg = fg1; };
        "ui.virtual.inlay-hint" = { fg = gray; };
        "ui.virtual.jump-label" = { fg = purple0; modifiers = ["bold"]; };
        "ui.virtual.ruler" = { bg = bg1; };
        "ui.virtual.whitespace" = bg2;
        "ui.virtual.wrap" = { fg = bg2; };
        "ui.window" = { bg = bg1; };

        "variable" = { fg = fg1; };
        "variable.builtin" = { fg = orange1; };
        "variable.other.member" = { fg = blue1; };
        "variable.parameter" = { fg = blue1; };
      };
    };
  };
}
