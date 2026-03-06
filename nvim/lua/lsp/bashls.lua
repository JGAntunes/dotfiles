return {
  settings = {
    bashIde = {
      -- Use shellcheck for linting (requires shellcheck installed)
      shellcheckPath = "shellcheck",
      -- Glob to include/exclude files
      globPattern = "*@(.sh|.inc|.bash|.command)",
      -- Enable shellcheck integration
      enableSourceErrorDiagnostics = true,
    },
  },
}
