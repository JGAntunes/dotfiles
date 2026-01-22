return {
  -- Core Treesitter plugin
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
        "gowork",
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
        "comment",
        "sql",
        "helm"
      })
    -- start treesitter highlighting when a parser exists
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if lang then
          pcall(vim.treesitter.start, args.buf)
        end
      end,
    })
  end,
}
