return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" }, -- only load right before saving
  dependencies = {
    "LittleEndianRoot/mason-conform",
  },
  config = function()
    require("conform").setup({
      format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 500,
      },
      formatters_by_ft = {
        go = { lsp_format = "prefer" },
        lua = { "stylua" },
        javascript = { "prettierd", "prettier", "eslint_d" },
        typescript = { "prettierd", "prettier", "eslint_d" },
        -- other mappings
      },
    })
  end,
}
