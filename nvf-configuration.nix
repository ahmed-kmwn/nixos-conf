{ pkgs, ... }:
{
  programs.nvf = {
    enable = true;
    settings = {
      vim.clipboard = {
        enable = true;
        registers = "unnamedplus";
      };

      vim = {
        globals = {
          neovide_cursor_vfx_mode = "railgun";
          neovide_cursor_animation_length = 0.13;
          neovide_cursor_trail_size = 0.8;
          neovide_remember_window_size = true;
          neovide_remember_window_position = true;
          neovide_no_idle = true;
          neovide_floating_blur_amount_x = 2.0;
          neovide_floating_blur_amount_y = 2.0;
          neovide_line_padding = 2;
          neovide_padding_top = 0;
          neovide_padding_left = 0;
        };

        options = {
          tabstop = 2;
          shiftwidth = 2;
          expandtab = true;
          smartindent = true;
          number = true;
          relativenumber = true;
          hlsearch = true;
          incsearch = true;
          ignorecase = true;
          smartcase = true;
          guifont = "JetBrainsMono Nerd Font:h10";
        };

        ui.noice.enable = true;

        visuals = {
          fidget-nvim.enable = true;
          nvim-web-devicons.enable = true;
          indent-blankline.enable = true;
          cinnamon-nvim.enable = true;
        };

        dashboard.alpha.enable = true;

        keymaps = [
          {
            key = "<Esc>";
            mode = "n";
            action = ":nohlsearch<CR>";
            silent = true;
          }
          {
            key = "<C-S-c>";
            mode = "v";
            action = "\"+y";
            silent = true;
          }
          {
            key = "<C-S-v>";
            mode = "i";
            action = "<C-r>+";
            silent = true;
          }
          {
            key = "<C-S-v>";
            mode = "n";
            action = "\"+p";
            silent = true;
          }
          {
            key = "<leader>ff";
            mode = "n";
            action = ":Telescope find_files<CR>";
            silent = true;
          }
          {
            key = "<leader>fg";
            mode = "n";
            action = ":Telescope live_grep<CR>";
            silent = true;
          }
          {
            key = "<leader>fr";
            mode = "n";
            action = ":Telescope oldfiles<CR>";
            silent = true;
          }
        ];

        lsp = {
          enable = true;
          formatOnSave = true;
          lspconfig.enable = true;
        };

        languages = {
          haskell.enable = true;
          rust.enable = true;
          nix.enable = true;
          ocaml.enable = true;
        };

        formatter.conform-nvim.enable = true;

        treesitter = {
          enable = true;
          grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
            nix
            haskell
            rust
          ];
        };

        autocomplete.nvim-cmp.enable = true;
        theme = {
          enable = true;
          name = "tokyonight";
          style = "night";
        };
        filetree.nvimTree = {
          enable = true;
          openOnSetup = false;
          mappings.toggle = "<leader>e";
        };
        statusline.lualine.enable = true;
        telescope.enable = true;
        binds.whichKey.enable = true;
      };
    };
  };
}
