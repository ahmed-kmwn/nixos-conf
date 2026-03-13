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
        };

        keymaps = [
          {
            key = "<Esc>";
            mode = "n";
            action = ":nohlsearch<CR>";
            silent = true;
          }
        ];

        lsp = {
          enable = true;
          formatOnSave = true;
          lspconfig.enable = true;

        };

        languages.haskell.enable = true;
        languages.rust.enable = true;
        languages.nix.enable = true;
        languages.ocaml.enable = true;

        treesitter = {
          enable = true;
          grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
            nix
            haskell
            rust
          ];
        };

        autocomplete.nvim-cmp.enable = true;

        visuals = {
          fidget-nvim.enable = true;
          nvim-web-devicons.enable = true;
          indent-blankline.enable = true;
        };

        theme = {
          enable = true;
          name = "tokyonight";
          style = "night";
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        ui.noice.enable = true;
        filetree.nvimTree.enable = true;
        binds.whichKey.enable = true;
      };
    };
  };
}
