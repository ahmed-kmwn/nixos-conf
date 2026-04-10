{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.greybird;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    gtk3.extraCss = ''
      * {
        outline: none;
        -gtk-outline-radius: 0;
      }
      scrollbar {
        min-width: 6px;
        min-height: 6px;
      }
      scrollbar slider {
        min-width: 6px;
        min-height: 6px;
        border-radius: 9px;
      }
    '';

    gtk2.extraConfig = ''
      style "no-focus-rect" {
        GtkWidget::focus-line-width = 0
        GtkWidget::focus-padding = 0
      }
      class "*" style "no-focus-rect"
    '';
  };

  xfconf.settings = {
    xfwm4 = {
      "general/theme" = "Greybird-dark";
      "general/title_alignment" = "center";
    };
    xsettings = {
      "Net/ThemeName" = "Adwaita-dark";
      "Net/IconThemeName" = "Papirus-Dark";
    };
  };

  home.packages = with pkgs; [ ];
}
