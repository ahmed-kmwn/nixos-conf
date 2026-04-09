{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "Greybird-dark";
      package = pkgs.greybird;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  xfconf.settings = {
    xfwm4 = {
      "general/theme" = "Greybird-dark";
      "general/title_alignment" = "center";
    };
    xsettings = {
      "Net/ThemeName" = "Greybird-dark";
      "Net/IconThemeName" = "Papirus-Dark";
    };
  };

  home.packages = with pkgs; [
  ];
}
