local M = {}

-- Common on_attach
M.on_attach = function(client, bufnr)
  local map = function(mode, keys, func, desc)
    vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
  end
  -- local builtin = require("telescope.builtin")
  --
  -- local builtin_opts = { jump_type = "never", reuse_win = true }
  -- map("n", "<leader>gd", function()
  --   builtin.lsp_definitions(builtin_opts)
  -- end, "Go to Definition")
  -- map("n", "<leader>gi", function()
  --   builtin.lsp_implementations(builtin_opts)
  -- end, "Go to Implementation")
  -- map("n", "<leader>gr", function()
  --   builtin.lsp_references(builtin_opts)
  -- end, "Go to References")
  map("n", "K", vim.lsp.buf.hover, "Hover Docs")
  map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
  map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
end

return M
