return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Common LSP settings
      vim.lsp.config("*", require("lsp.shared-config"))
      -- Custom LSP setup
      vim.lsp.config("lua_ls", require("lsp.lua_ls"))
      vim.lsp.config("eslint", require("lsp.eslint"))
      vim.lsp.config("gopls", require("lsp.gopls"))
      vim.lsp.config("helm_ls", require("lsp.helm_ls"))

      -- Mason setup
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "gopls", "ts_ls", "eslint", "helm_ls", "yamlls" },
        automatic_enable = true,
      })

      -- Tune diagnostics
      vim.diagnostic.config({
        virtual_text = true,      -- still keep inline error signs (or set false to hide)
        signs = true,             -- left gutter signs
        underline = true,         -- underline the problem
        update_in_insert = false, -- do not update diagnostics while typing
        severity_sort = true,     -- show most serious first
        float = {
          border = "rounded",
          source = true,
          header = "",
          prefix = "",
        },
      })
    end,
  },
}
