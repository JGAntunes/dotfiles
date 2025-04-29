return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonLog" },
  opts = {},
}
