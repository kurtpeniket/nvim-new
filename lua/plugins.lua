return {
  -- ================================================================================
  -- COLORSCHEME
  -- ================================================================================
  {
    'shaunsingh/nord.nvim',
    lazy = false,
    event = 'ColorScheme',
    priority = 1000,
    config = function()
      vim.g.nord_italic = false
    end
  },

  -- ================================================================================
  -- TPOPE ESSENTIALS
  -- ================================================================================
  { 'tpope/vim-rails' },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-commentary' },
  { 'tpope/vim-rhubarb' },

  -- ================================================================================
  -- TEXT OBJECTS & EDITING
  -- ================================================================================
  {
    'kana/vim-textobj-user',
    lazy = false,
    priority = 900,
  },

  { 'nelstrom/vim-textobj-rubyblock', lazy = false },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },

  -- ================================================================================
  -- FILE MANAGEMENT & NAVIGATION
  -- ================================================================================
  {
    'kyazdani42/nvim-tree.lua',
    cmd = 'NvimTreeToggle',
    keys = {
      { '<leader><TAB>', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle file tree' },
      { '<leader>r', '<cmd>NvimTreeRefresh<cr>', desc = 'Refresh file tree' },
    },
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
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    keys = {
      { '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Find files" },
      { '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Live grep" },
      { '<leader>fd', "<cmd>lua require('telescope.builtin').live_grep({prompt_title='Search in Directory', cwd=vim.fn.input('Directory: ', '', 'dir')})<cr>", desc = "Grep in directory" },
      { '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "Find buffers" },
      { '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = "Help tags" },
      { '<leader>fs', "<cmd>lua require('telescope.builtin').grep_string()<cr>", desc = "Grep string" },
      { '<leader>rm', "<cmd>lua require('telescope.builtin').find_files({prompt_title='Rails Models', cwd='app/models'})<cr>", desc = "Rails models" },
      { '<leader>rc', "<cmd>lua require('telescope.builtin').find_files({prompt_title='Rails Controllers', cwd='app/controllers'})<cr>", desc = "Rails controllers" },
      { '<leader>rv', "<cmd>lua require('telescope.builtin').find_files({prompt_title='Rails Views', cwd='app/views'})<cr>", desc = "Rails views" },
      { '<leader>fr', "<cmd>lua require('telescope.builtin').oldfiles()<cr>", desc = "Recent files" },
      { '<leader>fm', "<cmd>lua require('telescope.builtin').lsp_document_symbols({symbols={'method', 'function'}})<cr>", desc = "Find methods" },
    },
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

  -- ================================================================================
  -- UI & APPEARANCE
  -- ================================================================================
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup {
        default = true
      }
    end,
  },

  -- {
  --   'akinsho/bufferline.nvim',
  --   event = 'VeryLazy',
  --   config = function()
  --     require('bufferline').setup {
  --       options = {
  --         offsets = { { filetype = "NvimTree", text = "Tree", highlight = "Directory", text_align = "left" } },
  --         numbers = 'buffer_id',
  --         show_buffer_close_icons = false
  --       }
  --     }
  --   end,
  -- },

  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    config = function()
      require('lualine').setup {
        options = { 
          theme = 'auto',
          section_separators = { left = '', right = '' },
          component_separators = { left = '|', right = '|' }
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff' },
          lualine_c = {
            {
              'buffers',
              use_mode_colors = true,
              symbols = {
                modified = ' ●',      -- Text to show when the buffer is modified
                alternate_file = '#', -- Text to show to identify the alternate file
                directory =  '',     -- Text to show when the buffer is a directory
              },
            }
          },
          lualine_x = { 'filetype' },
          lualine_y = { { 'filename', path = 1 } },
          lualine_z = { 'location' }
        },
        disabled_filetypes = { 'Plug', 'NVimTree' }
      }
    end,
  },

  -- ================================================================================
  -- DEVELOPMENT TOOLS
  -- ================================================================================
  {
    'Pocco81/auto-save.nvim',
    event = { 'InsertLeave', 'TextChanged' },
    config = function()
      require("auto-save").setup {
        debounce_delay = 1000,
        execution_message = {
          message = function() return "" end,
        },
        condition = function(buf)
          local filename = vim.fn.bufname(buf)

          -- Don't auto-save nvim config files
          if string.match(filename, "%.config/nvim/") then
            return false
          end

          return true
        end,
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
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('gitsigns').setup()
    end,
  },

  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  },

  -- ================================================================================
  -- LSP & COMPLETION
  -- ================================================================================
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

      -- LSP keymaps
      vim.keymap.set("n", "<leader>gh", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    end,
  },

  { "hrsh7th/cmp-nvim-lsp" },

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
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },

  -- ================================================================================
  -- AI & CODE ASSISTANCE
  -- ================================================================================
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter'
  },

  -- ================================================================================
  -- DEPENDENCIES
  -- ================================================================================
  { 'nvim-lua/plenary.nvim' },
}
