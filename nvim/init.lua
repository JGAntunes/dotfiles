-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ","
-- Remap '\' to ',' (dunno why I have this though)
vim.keymap.set("", "\\", ",", { noremap = true, silent = true, desc = "Map \\ to ," })

require("config.options")
require("config.lazy")
require("config.autocommands")
require("config.keymaps")
