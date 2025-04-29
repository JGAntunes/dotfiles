--
-- Options
--

vim.opt.termguicolors = true

-- visual guideline for 120 characters
vim.opt.colorcolumn = "120"
-- enable relative numbers
vim.opt.relativenumber = true
-- set the current line its number, instead of 0
vim.opt.number = true
-- enable mouse and scroll
vim.opt.mouse = "a"
-- check if file was changed outside of vim
vim.opt.autoread = true
-- command line completions
vim.opt.wildmenu = true
vim.opt.wildmode = "full"
-- tabs and indent
vim.opt.expandtab = true -- use spaces, not tabs
vim.opt.tabstop = 2 -- a tab appears as 2 spaces
vim.opt.shiftwidth = 2 -- auto-indent uses 2 spaces
vim.opt.softtabstop = 2 -- pressing tab inserts 2 spaces
vim.opt.autoindent = true
