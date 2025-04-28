return {
  "folke/which-key.nvim",
  opts = {
    triggers = {
      { "<auto>", mode = "nixsotc" },
      { "<leader>", mode = "nixsotc" },
      -- { "<C->", mode = "nixsotc" }, can't make this work to show CTRL mappings
    },
    win = {
      border = "rounded",
    },
    layout = {
      spacing = 6,
    },
  },
}
