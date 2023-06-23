
local fn = vim.fn

-- Automatically install packer

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
        PACKER_BOOTSTRAP = fn.system({
                "git",
                "clone",
                "--depth",
                "1",
                "https://github.com/wbthomason/packer.nvim",
                install_path,
        })
        print("Installing packer close and reopen Neovim...")
        vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
        return
end

-- Have packer use a popup window
packer.init({
        display = {
                open_fn = function()
                        return require("packer.util").float({ border = "rounded" })
                end,
        },
})

--****************************************************************************************
-- Plugins start here
return packer.startup(function(use)

  use ("wbthomason/packer.nvim") --packer
  use ("nvim-lua/plenary.nvim")

-- icons
  use("nvim-tree/nvim-web-devicons")

-- comment
  use("numToStr/Comment.nvim")

-- autoclose brackets and so on
  use ("m4xshen/autoclose.nvim")

-- telescope
  use ({"nvim-telescope/telescope.nvim", branch = "0.1.x"})
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

-- nvim-tree as file explorer
  use("nvim-tree/nvim-tree.lua")

-- tree-sitter
  use ({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})  

  use("HiPhish/nvim-ts-rainbow2") -- rainbow
  use("windwp/nvim-ts-autotag") -- autoclose Tag TODO

  use({"folke/zen-mode.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
  }
  )
  use({"folke/twilight.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
  }
  )

-- nvim-cmp
  -- use ('neovim/nvim-lspconfig')
  -- use ('hrsh7th/cmp-buffer')
  -- use ('hrsh7th/cmp-path')
  -- use ('hrsh7th/cmp-cmdline')
  --
  -- use ('L3MON4D3/LuaSnip')
  -- use ('hrsh7th/nvim-cmp')
  -- use ('hrsh7th/cmp-nvim-lsp')
  -- use ('saadparwaiz1/cmp_luasnip')

-- snippets
  use("rafamadriz/friendly-snippets")


-- lsp-zero
use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
      'williamboman/mason.nvim',
      run = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip',
      dependencies = {"rafamadriz/friendly-snippets"}},     -- Required
  }
}







--****************************************************************************************
  -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if PACKER_BOOTSTRAP then
                require("packer").sync()
	end
end)

