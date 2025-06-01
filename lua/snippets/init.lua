local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

-- Load VSCode style snippets from friendly-snippets (which you already have)
require("luasnip.loaders.from_vscode").lazy_load()
ls.filetype_extend("eruby", {"html"})

ls.add_snippets("html", {
  s("!", fmt([[
  -- Div with class
  s("div", fmt([[
<div class="{}">
  {}
</div>
  ]], {
    i(1, ""),
    i(2, "")
  })),
})

-- Key mappings for snippet navigation
vim.keymap.set({"i", "s"}, "<C-j>", function()
  if ls.jumpable(1) then ls.jump(1) end
end)

vim.keymap.set({"i", "s"}, "<C-k>", function()
  if ls.jumpable(-1) then ls.jump(-1) end
end)

-- Expand snippet or jump
vim.keymap.set({"i"}, "<Tab>", function()
  if ls.expandable() then
    ls.expand()
  elseif ls.jumpable(1) then
    ls.jump(1)
  else
    -- Pass through Tab if no snippet action is available
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  end
end)
