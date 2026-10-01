{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      efi.canTouchEfiVariables = false;
    };
    kernelPackages = pkgs.linuxPackages_zen;
    plymouth = {
      enable = true;
      theme = "nixos-bgrt";
      themePackages = [ pkgs.nixos-bgrt-plymouth ];
    };
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];
    loader.timeout = 0;
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 100;
  };

  security.rtkit.enable = true;

  virtualisation.libvirtd.enable = true;

  time.timeZone = "Asia/Shanghai";

  console = {
    useXkbConfig = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
    packages = [ pkgs.terminus_font ];
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          fcitx5-gtk
          qt6Packages.fcitx5-chinese-addons
          qt6Packages.fcitx5-configtool
        ];
      };
    };
  };

  services = {
    xserver = {
      xkb = {
        layout = "us";
        variant = "";
      };
      videoDrivers = [
        "amdgpu"
        "nvidia"
      ];
    };
    displayManager.plasma-login-manager.enable = true;
    desktopManager.plasma6.enable = true;
    flatpak.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa.enable = true;
    };
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = [
        pkgs.nvidia-vaapi-driver
      ];
    };
    nvidia = {
      open = true;
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = false;
      };
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        amdgpuBusId = "PCI:5:0:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  networking = {
    networkmanager.enable = true;
    hostName = "myNixOS";
    firewall = {
      trustedInterfaces = [ "virbr0" ];
    };
  };

  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      nerd-fonts.code-new-roman
    ];
  };

  users.users.skye = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "libvirtd"
    ];
    shell = pkgs.zsh;
  };

  environment = {
    variables = {
      EDITOR = "hx";
    };
    systemPackages = with pkgs; [
      nvtopPackages.full
      wl-clipboard
      nix-tree
      dnsmasq
      darkly
      yt-dlp
      helix
      wget
      btop

      fastfetch
      starship
      ripgrep
      eza
      fzf
      bat
      fd

      clang
      clang-tools
      gnumake
      cmake
      cargo
      rustc
      clippy
      rustfmt
      rust-analyzer
      nil
      nixd
      (jdt-language-server.override { jdk = pkgs.jdk21; })

      gimp
      krita
      haruna
      inkscape
      obsidian
      zed-editor
      pdfarranger
      libreoffice-qt
      kdePackages.kcalc
      kdePackages.kamoso
      kdePackages.kdenlive
      kdePackages.kjournald
      kdePackages.partitionmanager
    ];
  };

  programs = {
    zsh = {
      enable = true;
      enableCompletion = false;
      shellAliases = {
        l = "eza -alh --icons --git";
        ll = "eza -lh --icons --git";
        ls = "eza --icons --git";
        cat = "bat";
        tree = "eza --tree";
        find = "fd --color=auto";
        grep = "rg --color=auto";
        diff = "diff --color=auto";
      };
    };
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
    yazi = {
      enable = true;
      package = pkgs.yazi.override {
        _7zz = pkgs._7zz-rar;
      };
    };
    java = {
      enable = true;
      package = pkgs.jdk21;
    };
    nix-ld.enable = true;
    virt-manager.enable = true;
    thunderbird.enable = true;
    firefox.enable = true;
    steam.enable = true;
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        obs-pipewire-audio-capture
        obs-vkcapture
        obs-vaapi
      ];
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
      connect-timeout = 5;
      fallback = true;
      substituters = [
        "https://mirror.sjtu.edu.cn/nix-channels/store"
        "https://mirrors.ustc.edu.cn/nix-channels/store"
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      ];
    };
    channel.enable = false;
  };

  system.stateVersion = "26.11";
}
