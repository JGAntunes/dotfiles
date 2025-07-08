return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- make sure we use native fzf
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help Tags" },
    { "gd", "<cmd>Telescope lsp_definitions<CR>", desc = "LSP definitions" },
    { "gi", "<cmd>Telescope lsp_implementations<CR>", desc = "LSP implementations" },
    { "gr", "<cmd>Telescope lsp_references<CR>", desc = "LSP references" },
    { "<leader>sd", "<cmd>Telescope diagnostics<CR>", desc = "LSP diagnostics" },
    { "<leader>sk", "<cmd>Telescope keymaps<CR>", desc = "Fuzzy search Keymaps" },
    { "<leader>sj", "<cmd>Telescope jumplist<CR>", desc = "Fuzzy search Jump List" },
    { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Fuzzy search in the current buffer" },
    { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Fuzzy search Git commits" },
  },
  config = function()
    local actions = require("telescope.actions")

    require("telescope").setup({
      extensions = {
        fzf = {
          fuzzy = true, -- enable fuzzy matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
      },
      mappings = {
        n = {
          -- mimic neotree
          ["<s>"] = actions.select_vertical,
          ["<S>"] = actions.select_vertical,
        },
      },
    })
    require("telescope").load_extension("fzf")
  end,
}
