{ ... }: {
  programs.fish = {
    enable = true;

    shellAliases = {
      "ls" = "eza --icons=always";
      "cat" = "bat";
      "top" = "bpytop";
      "f" = "yazi";
    };

    shellAbbrs = {
      
    };

    shellInit = ''
      eval "$(zoxide init --cmd cd fish)"
    '';
  };
}
