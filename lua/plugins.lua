return {
  {'shaunsingh/nord.nvim', lazy = false, priority = 1000},
  {'tpope/vim-rails'},
  {'tpope/vim-fugitive'},
  {'tpope/vim-surround'},
  {'tpope/vim-repeat'},
  {'tpope/vim-commentary'},
  {'tpope/vim-abolish'},
  {'kana/vim-textobj-user', lazy = false, priority = 900},
  {'nelstrom/vim-textobj-rubyblock', lazy = false},
  {'tmsvg/pear-tree'},
  {'nvim-lua/plenary.nvim'},
  {
    'Pocco81/auto-save.nvim',
    lazy = false,
    config = function()
      require("auto-save").setup {
      }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "ruby", "javascript", "python", "html", "css" },
        auto_install = true
      }
    end,
  },
  {'kyazdani42/nvim-web-devicons', lazy = true},
  {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup {
        update_focused_file = { enable = true },
        view = { width = 60, side = 'right' },
        actions = { open_file = { quit_on_open = true } },
        renderer = { indent_markers = { enable = true } }
      }
    end,
  },
  {
    'akinsho/bufferline.nvim',
    config = function()
      require('bufferline').setup{
        options = {
          offsets = {{filetype = "NvimTree", text = "Tree", highlight = "Directory", text_align = "left"}},
          numbers = 'buffer_id',
          show_buffer_close_icons = false
        }
      }
    end,
  },
  {'nvim-telescope/telescope.nvim', tag = '0.1.0'},
  {
    'nvim-telescope/telescope-fzy-native.nvim',
    config = function()
      require('telescope').setup {
        defaults = {
          mappings = {
            n = {
              ['<C-q>'] = require('telescope.actions').send_selected_to_qflist + require('telescope.actions').open_qflist,
            },
          },
        }
      }
      require('telescope').load_extension('fzy_native')
    end,
  },
  {'neovim/nvim-lspconfig'},
  {'rafamadriz/friendly-snippets'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'hrsh7th/cmp-cmdline'},
  {'hrsh7th/nvim-cmp'},
  {'hrsh7th/cmp-vsnip'},
  {'hrsh7th/vim-vsnip'},
  {'hrsh7th/vim-vsnip-integ'},
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup{
        options = { theme = 'nord' },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = { {'filename', path = 1} },
            lualine_x = {'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
        disabled_filetypes = { 'Plug', 'NVimTree' }
      }
    end,
  },
  {'maxmellon/vim-jsx-pretty'},
  {'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup() end},
  {'dstein64/vim-startuptime', lazy = true},
}

