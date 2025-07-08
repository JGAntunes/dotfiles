return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    -- Disable Copilot suggestions and panel since these will be handled by giuxtaposition/blink-cmp-copilot
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
    })
  end,
}
