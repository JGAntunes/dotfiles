local lsp = require("lsp.shared-config")

local lazypath = vim.fn.stdpath("data") .. "/lazy"

return {
  on_attach = lsp.on_attach,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } }, -- supress the annoying global warnings
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          vim.fn.stdpath("config") .. "/lua", -- this line makes sure we have completions for our local plugins
          lazypath, -- this line adds lazy plugins
        },
      },
      telemetry = { enable = false },
    },
  },
}
