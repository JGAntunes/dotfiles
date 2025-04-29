local M = {}

-- Common on_attach
M.on_attach = function(client, bufnr)
  local map = function(mode, keys, func, desc)
    vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
  end

  map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
  map("n", "K", vim.lsp.buf.hover, "Hover Docs")
  map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
  map("n", "gr", vim.lsp.buf.references, "References")
  map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
  map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
end

return M
