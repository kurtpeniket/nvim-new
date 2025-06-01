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
    require("auto-save").setup {
      debounce_delay = 500, -- saves 500ms after changes stop
      execution_message = {
        message = function() return "" end, -- silent auto-save
      },
    }
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

{
  'nvim-tree/nvim-web-devicons',
  config = function()
    require('nvim-web-devicons').setup {
      -- Forces all icons to be loaded at startup
      default = true
    }
  end,
},

  {
    'kyazdani42/nvim-tree.lua',
    lazy = true,
    cmd = 'NvimTreeToggle',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup {
        update_focused_file = { enable = true },
        view = { width = 40, side = 'left' },
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

{
  'nvim-telescope/telescope.nvim',
  config = function()
    require('telescope').setup {
      defaults = {
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        path_display = { "truncate" },
        layout_config = {
          horizontal = {
            preview_width = 0.55,
          },
        },
        mappings = {
          n = {
            ['<C-q>'] = require('telescope.actions').send_selected_to_qflist + require('telescope.actions').open_qflist,
          },
        },
      }
    }
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
        capabilities = capabilities,
        filetypes = { "ruby", "erb" }
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

  {
    'Exafunction/codeium.vim',
    event = 'BufEnter'
  },

 -- {
   -- "yetone/avante.nvim",
     -- config = function()
       -- require('avante').setup()
     -- end,
   -- event = "VeryLazy",
   -- version = false, -- Never set this value to "*"! Never!
   -- -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
   -- build = "make",
   -- -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
   -- dependencies = {
     -- "nvim-treesitter/nvim-treesitter",
     -- "stevearc/dressing.nvim",
     -- "nvim-lua/plenary.nvim",
     -- "MunifTanjim/nui.nvim",
     -- --- The below dependencies are optional,
     -- "echasnovski/mini.pick", -- for file_selector provider mini.pick
     -- "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
     -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
     -- "ibhagwan/fzf-lua", -- for file_selector provider fzf
     -- "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
     -- "zbirenbaum/copilot.lua", -- for providers='copilot'
     -- {
       -- -- support for image pasting
       -- "HakonHarnes/img-clip.nvim",
       -- event = "VeryLazy",
       -- opts = {
         -- -- recommended settings
         -- default = {
           -- embed_image_as_base64 = false,
           -- prompt_for_file_name = false,
           -- drag_and_drop = {
             -- insert_mode = true,
           -- },
           -- -- required for Windows users
           -- use_absolute_path = true,
         -- },
       -- },
     -- },
  -- },

  -- {
  --   'nvim-telescope/telescope-ui-select.nvim',
  --   config = function()
  --     require('telescope').setup {
  --       extensions = {
  --         ['ui-select'] = {
  --           require('telescope.themes').get_dropdown {}
  --         }
  --       }
  --     }
  --     require('telescope').load_extension('ui-select')
  --   end,
  --   dependencies = { 'nvim-telescope/telescope.nvim' }
  -- },

  -- {
  --   "David-Kunz/gen.nvim",
  --   opts = {
  --     model = "llama3.1:latest",
  --     prompts = require('custom_prompts')
  --   }
  -- },

  -- {
  --   'github/copilot.vim',
  --   lazy = false
  -- },
}

