return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" }, -- only load right before saving
  dependencies = {
    "LittleEndianRoot/mason-conform",
  },
  config = function()
    require("conform").setup({
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      },
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
        lua = { "stylua" },
        javascript = { "prettierd", "prettier" },
        -- other mappings
      },
    })
  end,
}
