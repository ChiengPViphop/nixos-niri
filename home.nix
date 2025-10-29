{ config, pkgs, inputs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "phouvongviphop";
  home.homeDirectory = "/home/phouvongviphop";

  home.stateVersion = "25.05"; # Please read the comment before changing.
  home.packages = with pkgs; [
    gtk3
    gtk4
    nwg-look
    vscodium
    libreoffice-fresh
    noto-fonts
    fastfetch


    ];

  home.file = {
    ".config/niri/config.kdl".source = ./configs/niri/config.kdl;

    
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/phouvongviphop/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
    inputs.niri.homeModules.niri
  ];
 
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    configPackages = [
      pkgs.gnome-session
    ];
  };

  programs.dankMaterialShell.enable = true;
 
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      rs = "sudo nixos-rebuild switch --impure --flake ~/nixos-niri/#nixos";
      config = "sudo nvim ~/nixos-niri/configuration.nix";
      home = "sudo nvim ~/nixos-niri/home.nix";
      edit = "sudo nvim ~/nixos-niri";
      flake = "sudo nvim ~/nixos-niri/flake.nix";
    };
  };


  programs.kitty = lib.mkForce {
  enable = true;
  settings = {
    confirm_os_window_close = 0;
    dynamic_background_opacity = true;
    enable_audio_bell = false;
    mouse_hide_wait = "-1.0";
    window_padding_width = 10;
    background_opacity = "0.9";
    background_blur = 5;
    symbol_map = let
      mappings = [
        "U+23FB-U+23FE"
        "U+2B58"
        "U+E200-U+E2A9"
        "U+E0A0-U+E0A3"
        "U+E0B0-U+E0BF"
        "U+E0C0-U+E0C8"
        "U+E0CC-U+E0CF"
        "U+E0D0-U+E0D2"
        "U+E0D4"
        "U+E700-U+E7C5"
        "U+F000-U+F2E0"
        "U+2665"
        "U+26A1"
        "U+F400-U+F4A8"
        "U+F67C"
        "U+E000-U+E00A"
        "U+F300-U+F313"
        "U+E5FA-U+E62B"
      ];
    in
      (builtins.concatStringsSep "," mappings) + " Symbols Nerd Font";
  };
};

}
