-- Clipboard: Yank and Paste to System Clipboard
vim.keymap.set("v", "<Leader>8", '"*y', { noremap = true, silent = true, desc = "Yank to system clipboard" })
vim.keymap.set(
  "v",
  "<Leader>9",
  '"*p',
  { noremap = true, silent = true, desc = "Paste from system clipboard (visual)" }
)
vim.keymap.set("n", "<Leader>9", '"*p', { noremap = true, silent = true, desc = "Paste from system clipboard" })

-- Open terminal in 10-line horizontal split
vim.keymap.set(
  "n",
  "<Leader>t",
  ":10split +te<CR>",
  { noremap = true, silent = true, desc = "Open terminal (10 lines)" }
)

-- Window splits
vim.keymap.set("", "<Leader>v", ":vsplit<CR>", { noremap = true, silent = true, desc = "Vertical split" })
vim.keymap.set("", "<Leader>h", ":split<CR>", { noremap = true, silent = true, desc = "Horizontal split" })

-- Window exit shortcuts
vim.keymap.set("", "<Leader>q", ":q<CR>", { noremap = true, silent = true, desc = "Quit window" })
vim.keymap.set("", "<Leader>qa", ":qa<CR>", { noremap = true, silent = true, desc = "Quit all" })

-- Uppercase/mixed-case command aliases
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("WA", "wa", {})
vim.api.nvim_create_user_command("Wa", "wa", {})
vim.api.nvim_create_user_command("WQ", "wq", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("QA", "qa", {})
vim.api.nvim_create_user_command("Qa", "qa", {})
vim.api.nvim_create_user_command("Up", "up", {})
vim.api.nvim_create_user_command("UP", "up", {})
