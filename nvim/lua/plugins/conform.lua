return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" }, -- only load right before saving
  dependencies = {
    "LittleEndianRoot/mason-conform",
  },
  config = function()
    require("conform").setup({
      format_on_save = function(bufnr)
        -- Go formatting is handled entirely by go.nvim's goimports() autocmd
        if vim.bo[bufnr].filetype == "go" then
          return nil
        end
        return { lsp_format = "fallback", timeout_ms = 500 }
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd", "prettier", "eslint_d" },
        typescript = { "prettierd", "prettier", "eslint_d" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        -- other mappings
      },
    })
  end,
}
