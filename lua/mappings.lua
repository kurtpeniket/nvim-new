-- Copy whole file to system clipboard with metadata
vim.api.nvim_create_user_command('CopyFileWithPath', function()
    local filepath = vim.fn.expand('%:p')
    local filetype = vim.bo.filetype
    
    -- Create a structured comment block
    local metadata = string.format([[
# FILE_METADATA_BEGIN
# filepath: %s
# filetype: %s
# timestamp: %s
# FILE_METADATA_END

]], filepath, filetype, os.date("%Y-%m-%d %H:%M:%S"))
    
    local content = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local full_content = metadata .. table.concat(content, '\n') .. '\n'
    vim.fn.setreg('+', full_content)
    
    -- Add notification of successful copy
    vim.notify(
        string.format("Copied %s with metadata to clipboard", vim.fn.fnamemodify(filepath, ":t")),
        vim.log.levels.INFO,
        { title = "File Copied" }
    )
end, {})

vim.api.nvim_set_keymap('n', '<leader>fy', ':CopyFileWithPath<CR>', { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<leader>cp', '<ESC>:Copilot panel<CR>', {noremap = true})

-- Gitsigns
vim.api.nvim_set_keymap('n', '<leader>tb', '<ESC>:Gitsigns toggle_current_line_blame<CR>', {noremap = true})

-- Vertical cursor column line
vim.api.nvim_set_keymap('n', '<leader>\\', '<ESC>:set cursorcolumn!<CR>', {noremap = true})

-- Re-indent file
vim.api.nvim_set_keymap('n', '<leader>ri', '<ESC>ggVG=', {noremap = true})

-- Buffer stuff
vim.api.nvim_set_keymap('n', '<leader>x', ':bd<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>vs', ':vspl #<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-L>', ':bnext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-H>', ':bprev<CR>', {noremap = true})

-- Git
vim.api.nvim_set_keymap('n', '<leader>b', ':G blame<CR>', {noremap = true})

-- Terminal
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true}) -- Escape :term
-- no spell in terminal
vim.api.nvim_create_autocmd({"TermOpen"}, {
  command = "setlocal nospell",
  pattern = "*",
})
-- open in split
vim.api.nvim_set_keymap('n', '<leader>tt', '<ESC>:vsplit term://zsh<CR>', {noremap = true})

-- Close all buffers except current
vim.cmd([[command! BufOnly silent! execute "%bd|e#|bd#"]])
vim.api.nvim_set_keymap('n', '<leader>o', ':BufOnly<CR>', {noremap = true})

-- Remove highlight
vim.api.nvim_set_keymap('n', '<leader>h', ':noh<CR>', {noremap = true})

-- Move 1 more lines up or down in normal and visual selection modes
vim.api.nvim_set_keymap('n', 'K', ':m .-2<CR>==', {noremap = true})
vim.api.nvim_set_keymap('n', 'J', ':m .+1<CR>==', {noremap = true})
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", {noremap = true})
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true})

-- console.log variable under cursor
vim.api.nvim_set_keymap('n', '<leader>lo', '<ESC>yiwoconsole.log();<ESC>hhp<ESC>', {noremap = true})

-- Yank selection to system clipboard
vim.api.nvim_set_keymap('v', '<leader>y', '"*y', {noremap = true})

-- Yank inner word to system clipboard
vim.api.nvim_set_keymap('n', '<leader>t', 'viw"*y', {noremap = true})

-- Yank current file path to system clipboard
vim.api.nvim_set_keymap('n', '<leader>py', ':let @* = expand("%")<cr>', {noremap = true})

-- Ruby stuff
-- ERB tags
vim.api.nvim_set_keymap('n', '<leader>pe', '<ESC>a<%=  %><ESC>3hli', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>er', '<ESC>a<%  %><ESC>3hli', {noremap = true})

-- Rails raise
vim.api.nvim_set_keymap('n', '<leader>ra', '<ESC>iraise .inspect<ESC>2bi', {noremap = true})

-- New Ruby method
vim.api.nvim_set_keymap('n', '<leader>de', '<ESC>i<TAB>def<CR>end<ESC>kA<SPACE>', {noremap = true})

-- do end loop
vim.api.nvim_set_keymap('n', '<leader>do', '<ESC>A<SPACE>do<CR>end<ESC>kA<SPACE>\\|\\|<ESC>i', {noremap = true})

-- Ruby interpolation
vim.api.nvim_set_keymap('n', '<leader>[', '<ESC>a#{}<ESC>i', {noremap = true})

-- JS interpolation
vim.api.nvim_set_keymap('n', '<leader>4', '<ESC>a${}<ESC>i', {noremap = true})

-- map(&:)
vim.api.nvim_set_keymap('n', '<leader>&', '<ESC>A.map(&:)<ESC>$i', {noremap = true})

-- if/else
vim.api.nvim_set_keymap('n', '<leader>if', '<ESC>oif<ESC>oelse<ESC>oend<ESC>V2k=', {noremap = true})

-- columns
vim.api.nvim_set_keymap('n', '<leader>cd', '<ESC>0A<div class="columns"><ESC>o<div class="column"><ESC>o</div><ESC>o</div><ESC>V3k=', {noremap = true})

-- Inline class/style
vim.api.nvim_set_keymap('n', '<leader>as', '<ESC>a class=""<ESC>i', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>st', '<ESC>a style=""<ESC>i', {noremap = true})

-- Quickfix shortcuts
vim.api.nvim_set_keymap('n', '<leader>co', '<ESC>:copen<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>cl', '<ESC>:ccl<CR>', {noremap = true})

-- Notes
vim.api.nvim_set_keymap('n', '<leader>nn', '<ESC>:vsplit ~/notes/readme.md<CR>', {noremap = true})

-- Config
vim.api.nvim_set_keymap('n', '<leader>ec', '<ESC>:vsplit ~/.config/nvim/init.lua<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>es', '<ESC>:so ~/.config/nvim/init.lua<CR>', {noremap = true})

-- Abbreviations
vim.cmd 'cabbrev ec Econtroller'
vim.cmd 'cabbrev em Emigration'

-- Nvimtree stuff
vim.api.nvim_set_keymap('n', '<leader><TAB>', ':NvimTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', {noremap = true})

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fs', "<cmd>lua require('telescope.builtin').grep_string()<cr>", {noremap = true})

-- Git Stuff (Fugitive)
-- Git status
vim.api.nvim_set_keymap('n', '<leader>gs', ':G<CR>', {noremap = true})
-- Quick add+commit+push for current file
vim.api.nvim_create_user_command('GitAddCommit', function()
    -- Get the current file name for a better default message
    local file_name = vim.fn.expand('%:t')
    -- Default message includes the filename
    local default_msg = "Update " .. file_name
    -- Allow user to edit the message or accept default with Enter
    local commit_message = vim.fn.input('Commit message: ', default_msg)
    
    if commit_message ~= '' then
        vim.cmd('Gwrite')
        vim.cmd('Git commit -m "' .. commit_message .. '"')
        vim.notify('Committed: ' .. commit_message, vim.log.levels.INFO)
        
        -- Optionally, offer to push
        local push = vim.fn.input('Push? (y/n): ')
        if push:lower() == 'y' then
            vim.cmd('Git push')
            vim.notify('Pushed changes', vim.log.levels.INFO)
        end
    else
        vim.notify('Commit aborted', vim.log.levels.WARN)
    end
end, {})
vim.api.nvim_set_keymap('n', '<leader>gw', ':GitAddCommit<CR>', {noremap = true})
-- Git pull
vim.api.nvim_set_keymap('n', '<leader>gl', ':Git pull<CR>', {noremap = true})
-- Git diff split (vertical)
vim.api.nvim_set_keymap('n', '<leader>gd', ':Gvdiffsplit<CR>', {noremap = true})
-- Git checkout
vim.api.nvim_set_keymap('n', '<leader>gco', ':Git checkout ', {noremap = true})
-- Git branch 
vim.api.nvim_set_keymap('n', '<leader>gb', ':Git branch<CR>', {noremap = true})

-- Ollama stuff
vim.api.nvim_set_keymap('n', '<leader>]', ':Gen<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>]', ':Gen<CR>', { noremap = true })
