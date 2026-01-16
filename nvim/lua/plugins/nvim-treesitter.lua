return {
  -- Core Treesitter plugin
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require("nvim-treesitter").install(
        {
          "bash",
          "c",
          "cpp",
          "go",
          "gomod",
          "gosum",
          "gotmpl",
          "graphql",
          "lua",
          "python",
          "javascript",
          "typescript",
          "json",
          "yaml",
          "html",
          "css",
          "markdown",
          "vim",
          "regex",
          "ruby",
          "toml",
          "dockerfile",
          "tsx",
        })
    end,
  },

  -- Auto-close & rename HTML/JSX tags
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {
      opts = { enable_close_on_slash = true },
    },
  },
}
