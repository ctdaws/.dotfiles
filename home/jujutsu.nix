{ email, ... }: {
  programs.jujutsu = {
    enable = true;

    settings = {
      user = {
        name = "Chris Dawson";
        inherit email;
      };

      ui = {
        editor = "hx";
        pager = ["bat" "-p"];
        default-command = "st";
        diff.tool = ["difft" "--color=always" "$left" "$right"];
      };
    };
  };
}
