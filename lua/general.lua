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

-- Misc
vim.o.swapfile = false
vim.o.history = 1000
vim.o.updatetime = 100
vim.wo.signcolumn = 'yes'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.spelllang = 'en_gb'
vim.o.spell = true
vim.cmd 'runtime macros/matchit.vim'
if vim.fn.has("autocmd") then
  vim.cmd 'filetype indent plugin on'
end
vim.o.splitbelow = true
vim.o.splitright = true
vim.g.ackprg = 'ag --nogroup --nocolor --column'

-- Setup vsnip filetypes
vim.g.vsnip_filetypes = {}
vim.g.vsnip_filetypes.ruby = {'rails'}
vim.g.vsnip_filetypes.javascriptreact = {'javascript'}
vim.g.vsnip_filetypes.typescriptreact = {'typescript'}

