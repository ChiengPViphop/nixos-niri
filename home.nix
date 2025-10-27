{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "phouvongviphop";
  home.homeDirectory = "/home/phouvongviphop";

  home.stateVersion = "25.05"; # Please read the comment before changing.
  home.packages = with pkgs; [
    nautilus
    ];

  home.file = {
    ".config/niri/config.kdl".source = ./configs/niri/config.kdl;

    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
 
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

  programs.dankMaterialShell.enable = true;
 
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      rs = "sudo nixos-rebuild switch";
      config = "sudo nvim /etc/nixos/configuration.nix";
      home = "sudo nvim /etc/nixos/home.nix";
      edit = "sudo nvim /etc/nixos/";
    };
  };

}
