return {
  -- Core Treesitter plugin
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Languages to install parsers for
        ensure_installed = {
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
        },

        -- Enable code highlighting
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        -- Enable smarter indentation (optional)
        indent = {
          enable = true,
        },

        -- Optional: Text objects (e.g. `af`, `if`, `ac`, `ic`)
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
        },
      })
    end,
  },

  -- Auto-close & rename HTML/JSX tags
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
