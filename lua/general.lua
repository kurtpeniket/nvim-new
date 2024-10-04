-- Look
vim.o.number = true
vim.o.sidescroll = 1
vim.o.mouse = 'n'
vim.wo.wrap = false
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.cmd 'filetype on'
vim.o.termguicolors = true
vim.cmd 'colorscheme nord'
-- vim.cmd('set colorcolumn=80')

-- Misc
vim.cmd('syntax sync minlines=256')
vim.o.swapfile = false
vim.o.history = 1000
vim.o.updatetime = 100
vim.wo.signcolumn = 'yes'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.spelllang = 'en_gb'
vim.o.spell = true
-- What's this for?
--
-- vim.cmd 'runtime macros/matchit.vim'
-- if vim.fn.has("autocmd") then
--   vim.cmd 'filetype indent plugin on'
-- end
vim.o.splitbelow = true
vim.o.splitright = true
vim.g.ackprg = 'ag --nogroup --nocolor --column'

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Setup vsnip filetypes
-- Don't think I use this?
--
-- vim.g.vsnip_filetypes = {}
-- vim.g.vsnip_filetypes.ruby = {'rails'}
-- vim.g.vsnip_filetypes.javascriptreact = {'javascript'}
-- vim.g.vsnip_filetypes.typescriptreact = {'typescript'}

