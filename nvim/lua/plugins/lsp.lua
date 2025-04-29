-- ./lua/plugins/lsp.lua

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

      -- Common on_attach
      local on_attach = function(client, bufnr)
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

      -- Setup servers
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          vim.lsp.config[server_name] = {
            capabilities = capabilities,
            on_attach = on_attach,
          }
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
