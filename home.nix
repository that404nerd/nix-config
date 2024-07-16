{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "revanth";
  home.homeDirectory = "/home/revanth";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    zsh
    fish
    git
  ];

  programs.neovim = 
    let
      toLua = str: "lua << EOF\n${str}\nEOF\n";
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in 
    {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraPackages = with pkgs; [
        lua-language-server
        nodePackages_latest.diagnostic-languageserver
        libclang
      ];

      plugins = with pkgs.vimPlugins; [
        popup-nvim

        {
          plugin = nvim-autopairs;
          config = toLuaFile ./home-manager/nvim/lua/autopairs.lua;
        }

        nvim-web-devicons

        {
          plugin = nvim-tree-lua;
          config = toLuaFile ./home-manager/nvim/lua/nvim-tree.lua;
        }

        plenary-nvim
        
        {
          plugin = nvim-cmp;
          config = toLuaFile ./home-manager/nvim/lua/cmp.lua;
        }
        
        {
          plugin = nvim-lspconfig;
          config = toLuaFile ./home-manager/nvim/lua/lspconfig.lua;
        }

        friendly-snippets
        
        {
          plugin = telescope-nvim;
          config = toLuaFile ./home-manager/nvim/lua/telescope.lua;
        }

        telescope-file-browser-nvim

        {
          plugin = (nvim-treesitter.withPlugins (p: [
            p.tree-sitter-nix
            p.tree-sitter-lua
            p.tree-sitter-cpp
          ]));
          config = toLuaFile ./home-manager/nvim/lua/treesitter.lua;
        }

        nvim-web-devicons

        {
          plugin = indent-blankline-nvim;
          config = toLuaFile ./home-manager/nvim/lua/indent-blankline.lua;
        }

        {
          plugin = bufferline-nvim;
          config = toLuaFile ./home-manager/nvim/lua/bufferline.lua;
        }
        
        {
          plugin = onedark-nvim;
          config = "colorscheme onedark";
        }
        
        {
          plugin = which-key-nvim;
          config = toLuaFile ./home-manager/nvim/lua/which-key.lua;
        }

      ];

      extraLuaConfig = ''
        ${builtins.readFile ./home-manager/nvim/lua/options.lua}
        ${builtins.readFile ./home-manager/nvim/lua/keymaps.lua}
      '';
    };

  programs.home-manager.enable = true;
}
