return {
  {
    'shaunsingh/nord.nvim',
    lazy = false,
    event = 'ColorScheme',
    priority = 1000,
    config = function()
      vim.g.nord_italic = false
    end
  },

  {'tpope/vim-rails'},
  {'tpope/vim-fugitive'},
  {'tpope/vim-surround'},
  {'tpope/vim-repeat'},
  {'tpope/vim-commentary'},
  {'tpope/vim-rhubarb'},

  {
    'kana/vim-textobj-user',
    lazy = false,
    priority = 900,
  },

  {'nelstrom/vim-textobj-rubyblock', lazy = false},

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equivalent to setup({}) function
  },

  {'nvim-lua/plenary.nvim'},

  {
    'Pocco81/auto-save.nvim',
    lazy = false,
    config = function()
      require("auto-save").setup {}
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "ruby", "javascript", "python", "html", "css", "c", "svelte", "tsx" },
        auto_install = true
      }
    end,
  },

  -- {
    'nvim-tree/nvim-web-devicons',
  -- },

  {
    'kyazdani42/nvim-tree.lua',
    lazy = true,
    cmd = 'NvimTreeToggle',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup {
        update_focused_file = { enable = true },
        view = { width = 50, side = 'right' },
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

  {'nvim-telescope/telescope.nvim'},

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

  -- LSP stuff
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.ruby_lsp.setup({
        capabilities = capabilities
      })

      vim.keymap.set("n", "<leader>gh", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    end,
  },
  -- 

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

  {'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup() end},

  {'dstein64/vim-startuptime', lazy = true},

  {
    'lewis6991/gitsigns.nvim',
    lazy = false, 
    config = function()
      require('gitsigns').setup() 
    end,
  },

  -- {
  --   'Exafunction/codeium.vim',
  --    -- commit = "289eb724e5d6fab2263e94a1ad6e54afebefafb2",
  --    event = 'BufEnter'
  -- },
  {
    'github/copilot.vim',
    lazy = false
  },
}

