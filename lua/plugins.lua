local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'williamboman/mason.nvim' -- a plugin to install and manage LSP servers, debuggers and linters.
  use 'williamboman/mason-lspconfig.nvim' -- to complement Manson with other goodies.
  use 'neovim/nvim-lspconfig' -- a collection of lsp configs

  use 'simrat39/rust-tools.nvim' -- tools to automatically set up lspconfig for rust-analyzer.

  -- LSP completion source:
  use 'hrsh7th/cmp-nvim-lsp'

  -- Completion framework:
  use 'hrsh7th/nvim-cmp'

  -- Useful completion sources:
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/vim-vsnip'

  --
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- Debugger
  use 'puremourning/vimspector'

  -- Terminalintegration
  use 'voldikss/vim-floaterm'
  use "akinsho/toggleterm.nvim"

  -- Search
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = { {'nvim-lua/plenary.nvim'} } }
  use { 'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  -- Fileexplorer
  use { 'kyazdani42/nvim-tree.lua', -- Filesystem navigation
    requires = 'kyazdani42/nvim-web-devicons' } -- Filesystem icons

  use 'preservim/tagbar'
  use {"folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use {"folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use "lukas-reineke/indent-blankline.nvim"

  use {'m-demare/hlargs.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }

  use 'danilamihailov/beacon.nvim'
  use 'lewis6991/impatient.nvim'
  use 'simrat39/symbols-outline.nvim'
  use 'airblade/vim-gitgutter'
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' } -- good folding
  use 'windwp/nvim-autopairs'

  -- Theme / Font
  use "rebelot/kanagawa.nvim"
  use 'kyazdani42/nvim-web-devicons'
  use { 'nvim-lualine/lualine.nvim', -- Statusline
    requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use 'tpope/vim-surround'
  use 'j-hui/fidget.nvim' -- show status of nvim-lsp progress
  use 'RRethy/vim-illuminate'
  use {'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }
  use 'sbdchd/neoformat'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

