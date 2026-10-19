{ pkgs, ... }:

{
  programs = {
    # Shell
    starship = {
      enable = true;
      presets = [ "tokyo-night" ];
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      zsh-autoenv.enable = true;

      # Starship installs its prompt hook through programs.zsh.promptInit.
      # Keep custom shell setup here so it is parsed before that prompt hook.
      interactiveShellInit = ''
        # Plugins. Keep fzf-tab before autosuggestions and syntax highlighting
        # so its completion widgets are not replaced.
        eval "$(fzf --zsh)"
        source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
        source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
        source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
        source ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

        # Key bindings
        bindkey "^[[1;5D" backward-word
        bindkey "^[[1;5C" forward-word
        bindkey -M main "^[[A" history-substring-search-up
        bindkey -M main "^[[B" history-substring-search-down
        bindkey -M main "^[OA" history-substring-search-up
        bindkey -M main "^[OB" history-substring-search-down
      '';

      shellAliases = {
        l = "eza -alh --icons --git";
        ll = "eza -lh --icons --git";
        ls = "eza --icons --git";
        df = "df -h";
        cat = "bat";
        tree = "eza --tree";
        find = "fd --color=auto";
        grep = "rg --color=auto";
        diff = "diff --color=auto";
      };
    };

    # Development
    git = {
      enable = true;
      config = {
        init.defaultBranch = "main";
        user = {
          name = "skye-official";
          email = "skye_official@163.com";
        };
      };
    };

    dsh = {
      enable = true;
      profiles.tui.bundles = [ pkgs.dsh.bundles.tui ];
      defaultProfile = "nix-tui";
    };

    java = {
      enable = true;
      package = pkgs.jdk21;
    };

    nix-ld.enable = true;

    # Desktop applications
    yazi = {
      enable = true;
      package = pkgs.yazi.override {
        _7zz = pkgs._7zz-rar;
      };
    };

    virt-manager.enable = true;
    thunderbird.enable = true;

    steam.enable = true;

    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        obs-pipewire-audio-capture
        obs-vkcapture
        obs-vaapi
      ];
    };

    artcraft = {
      enable = true;
      linkFonts = false;
    };
  };
}
