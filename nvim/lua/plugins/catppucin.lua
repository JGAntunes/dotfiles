return {
  {
    "catppuccin/nvim",
    name = "catppuccin", -- explicitly set the name so you can refer to it easily
    priority = 1000, -- load before all other plugins
    lazy = false, -- load immediately on startup
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        integrations = {
          blink_cmp = true,
          treesitter = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
          cmp = true,
          gitsigns = true,
          telescope = true,
          which_key = true,
          indent_blankline = { enabled = true },
          mason = true,
          nvimtree = true,
          notify = true,
          mini = true,
        },
      })

      -- set colorscheme
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
