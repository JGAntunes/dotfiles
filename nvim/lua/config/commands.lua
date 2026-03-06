-- Set the theme based on the environment variable THEME
vim.api.nvim_create_user_command("ThemeSync", function()
  local theme = (vim.env.THEME == "light") and "light" or "dark"
  vim.o.background = theme
end, {})
