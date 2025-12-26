return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "franco-ruggeri/codecompanion-lualine.nvim",
  },
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin", -- match your colorscheme
        icons_enabled = true,
        globalstatus = true, -- single statusline across all windows
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = {
          { "diagnostics", sources = { "nvim_diagnostic" } },
          { "filename", path = 1 }, -- show relative path
        },
        lualine_x = { "codecompanion", "encoding", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      extensions = { "lazy", "neo-tree", "mason", "fzf" },
    })
  end,
}
