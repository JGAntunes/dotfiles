return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Mason setup
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "gopls" },
        automatic_installation = true, -- This isn't currently working with nvim 11 - https://github.com/williamboman/mason-lspconfig.nvim/issues/535
      })

      -- Setup servers
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          local ok, custom_config = pcall(require, "lsp.servers." .. server_name)
          if not ok then
            custom_config = require("lsp.shared-config") -- fallback to shared
          end
          vim.lsp.config[server_name] = custom_config
          vim.lsp.enable(server_name)
        end,
      })

      -- Tune diagnostics
      vim.diagnostic.config({
        virtual_text = true, -- still keep inline error signs (or set false to hide)
        signs = true, -- left gutter signs
        underline = true, -- underline the problem
        update_in_insert = false, -- do not update diagnostics while typing
        severity_sort = true, -- show most serious first
        float = {
          border = "rounded",
          source = "always", -- show where the error comes from (lsp, etc.)
          header = "",
          prefix = "",
        },
      })
    end,
  },
}
