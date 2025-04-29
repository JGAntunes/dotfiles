local lsp = require("lsp.shared-config")

return {
  on_attach = lsp.on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }, -- supress the annoying global warnings
      },
    },
  },
}
