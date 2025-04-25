return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  cmd = "Neotree",
  keys = {
    {
      "<C-t>",
      function()
        require("neo-tree.command").execute({ source = 'last', reveal = true, toggle = true })
      end,
      desc = "[Neotree] File Explorer",
    },
    {
      "<C-g>",
      function()
        require("neo-tree.command").execute({ source = "git_status", reveal = true, toggle = true })
      end,
      desc = "[Neotree] Git Explorer",
    },
    {
      "<C-b>",
      function()
        require("neo-tree.command").execute({ source = "buffers", reveal = true, toggle = true })
      end,
      desc = "[Neotree] Buffer Explorer",
    },
  },
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    default_source = "last",
    close_if_last_window = true,
    source_selector = {
      winbar = true,
      statusline = false,
    },
    sources = {
      "filesystem",
      "buffers",
      "git_status",
      "document_symbols",
    },
    window = {
      mappings = {
        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
          end,
          desc = "copy Path to Clipboard",
        },
        ["n"] = "next_source",
        ["N"] = "prev_source",
      },
    },
  },
}
