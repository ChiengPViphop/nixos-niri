{ config, pkgs, ... }:

{
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {

      layout = {

        background-color = "#00000000";

        focus-ring = {
          enable = true;
          width = 3;
          active = {
            color = "#A8AEFF";
          };
          inactive = {
            color = "#505050";
          };
        };

        gaps = 6;

        };
      };
    };
}
