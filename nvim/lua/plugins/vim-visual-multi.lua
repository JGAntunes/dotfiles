return {
  "mg979/vim-visual-multi",
  init = function()
    -- Set the mappings for multicursor
    vim.g.VM_maps = {
      ["Add Cursor Down"]    = "<C-j>",
      ["Add Cursor Up"]      = "<C-k>",
      ["Start Regex Search"] = "<Leader>/",
    }
  end,
}
