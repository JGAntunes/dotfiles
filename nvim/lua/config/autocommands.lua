-- Auto commands
local rootgroup = vim.api.nvim_create_augroup("jgantunes.root", { clear = true })

-- Automatically rebalance windows on resize
vim.api.nvim_create_autocmd("VimResized", {
  pattern = "*",
  group = rootgroup,
  command = "wincmd =",
  desc = "Automatically rebalance windows on resize",
})

-- Set json filetype for rc files
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { ".babelrc", ".eslintrc", ".stylelintrc" },
  group = rootgroup,
  desc = "Set json filetype for rc files",
  callback = function()
    vim.bo.filetype = "json"
  end,
})

-- Set commentstring for jsx/tsx files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript.tsx", "javascript.jsx" },
  group = rootgroup,
  desc = "Set commentstring for jsx/tsx files",
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})

-- Copilot blink integration
vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpMenuOpen",
  callback = function()
    vim.b.copilot_suggestion_hidden = true
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpMenuClose",
  callback = function()
    vim.b.copilot_suggestion_hidden = false
  end,
})
