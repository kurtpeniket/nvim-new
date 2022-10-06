"Plugins
"-------
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'navarasu/onedark.nvim'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/edge'
Plug 'shaunsingh/nord.nvim' "theme
Plug 'tpope/vim-rails' "rails support
Plug 'tpope/vim-fugitive' "GitHub support
Plug 'tpope/vim-surround' "vim operations on surrounding chars
Plug 'tpope/vim-repeat' "dot command works with plugins
Plug 'tpope/vim-commentary' "comment in/out mappings
Plug 'kana/vim-textobj-user' "block support for ruby (also below)
Plug 'nelstrom/vim-textobj-rubyblock'
Plug '907th/vim-auto-save' 
Plug 'tmsvg/pear-tree' "auto pair complete
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons' "icons
Plug 'kyazdani42/nvim-tree.lua' "file explorer
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-lualine/lualine.nvim' " Status line
call plug#end()

"Look
"----
set number
set sidescroll=1
set mouse=n
set nowrap
set expandtab
set shiftwidth=2
filetype on
autocmd Filetype c setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
set termguicolors
colorscheme nord

"Saving
"------
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1
set noswapfile

"Misc
"----
set updatetime=100
set signcolumn=yes
set ignorecase
set smartcase
let g:ruby_host_prog = 'rvm system do neovim-ruby-host'
set spelllang=en_gb
set spell
cabbrev ec Econtroller
runtime macros/matchit.vim
set nocompatible
if has("autocmd")
  filetype indent plugin on
endif
"Change the direction of new splits
set splitbelow
set splitright
let g:ackprg = 'ag --nogroup --nocolor --column'

"Mappings
"--------
"" Leader == space
nnoremap <SPACE> <Nop>
let mapleader=" "
"Disable arrow keys
noremap <Up> <NOP>
inoremap <Up> <NOP>
vnoremap <Up> <NOP>
noremap <Down> <NOP>
inoremap <Down> <NOP>
vnoremap <Down> <NOP>
noremap <Left> <NOP>
inoremap <Left> <NOP>
vnoremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Right> <NOP>
vnoremap <Right> <NOP>
"Buffer stuff
map <leader>x :bd<CR>
map <leader>vs :vspl #<CR>
map <C-L> :bnext<CR>
map <C-H> :bprev<CR>
map <leader>b :ls<CR>:b<Space>
"Close all buffers except current
command BufOnly silent! execute "%bd|e#|bd#"
nnoremap <leader>o :BufOnly<CR>
"Remove highlight
map <leader>h :noh<CR>
"Move 1 more lines up or down in normal and visual selection modes
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
"console.log variable under cursor
map <leader>lo <ESC>yiwoconsole.log();<ESC>hhp<ESC>
"Yank selection to system clipboard
noremap <leader>y "*y
"Yank inner word to system clipboard
noremap <leader>t viw"*y
"Yank current file path to system clipboard
noremap <leader>py :let @* = expand("%")<cr>
" Ruby stuff
" ERB tags
map <leader>pe <ESC>a<%=  %><ESC>3hli
map <leader>er <ESC>a<%  %><ESC>3hli
"Rails raise
map <leader>ra <ESC>iraise .inspect<ESC>2bi
"New Ruby method
map <leader>de <ESC>i<TAB>def<CR>end<ESC>kA<SPACE>
"Do End loop
map <leader>do <ESC>A<SPACE>do<CR>end<ESC>kA<SPACE>\|\|<ESC>i
"Ruby interpolation
map <leader>[ <ESC>a#{}<ESC>i
"Inline class/style
map <leader>as <ESC>a class=""<ESC>i
map <leader>st <ESC>a style=""<ESC>i
"Quickfix shortcuts
map <leader>co <ESC>:copen<CR>
map <leader>cl <ESC>:ccl<CR>
"Nvimtree stuff
nnoremap <leader><TAB> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
"Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string()<cr>
"LSP
" nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
" nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

"Status line
"-----------
" function! GitBranch()
"   return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
" endfunction
" function! StatuslineGit()
"   let l:branchname = GitBranch()
"   return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
" endfunction
" function! GitStatus()
"   let [a,m,r] = GitGutterGetHunkSummary()
"   return printf('+%d ~%d -%d', a, m, r)
" endfunction
" set statusline=
" set statusline+=%#PmenuSel#
" set statusline+=%{StatuslineGit()}
" set statusline+=%{GitStatus()}
" set statusline+=%#LineNr#
" set statusline+=\ %f
" set statusline+=%m\
" set statusline+=%=
" set statusline+=%#CursorColumn#
" set statusline+=\ %y
" set statusline+=\[%{&fileformat}\]
" set statusline+=\ %p%%
" set statusline+=\ %l:%c
" set statusline+=\ 
"-------------

lua << EOF
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

require'nvim-tree'.setup {
    update_focused_file = { enable = true },
    view = { width = 40 },
    actions = { open_file = { quit_on_open = true } },
    renderer = { indent_markers = { enable = true } }
  }

require("bufferline").setup{
  options = {
    offsets = {{filetype = "NvimTree", text = "File Explorer", highlight = "Directory", text_align = "left"}},
    numbers = 'buffer_id',
    show_close_icon = false,
  }
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "ruby", "javascript", "python", "html", "css" },
    auto_install = true
  }

local actions = require('telescope.actions')
require'telescope'.setup {
  defaults = {
    mappings = {
      n = {
        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
  }
}

require('telescope').load_extension('fzy_native')

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}
EOF

luafile ~/.config/nvim/lua/lsp_config.lua

