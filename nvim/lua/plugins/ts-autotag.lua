-- Auto-close & rename HTML/JSX tags
return {
  "windwp/nvim-ts-autotag",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    -- no idea why but it works - https://github.com/windwp/nvim-ts-autotag/issues/248
    opts = {
      -- Defaults
      enable_close = true,          -- Auto close tags
      enable_rename = true,         -- Auto rename pairs of tags
      enable_close_on_slash = false -- Auto close on trailing </
    }
  },
}
