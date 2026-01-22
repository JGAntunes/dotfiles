-- setup helm custom filetype
vim.filetype.add({
  extension = {
    gotmpl = "gotmpl",
  },
  pattern = {
    -- added config too because of some projects structure
    [".*/config/.*%.tpl"] = "helm",
    [".*/config/.*%.ya?ml"] = "helm",
    [".*/templates/.*%.tpl"] = "helm",
    [".*/templates/.*%.ya?ml"] = "helm",
    ["helmfile.*%.ya?ml"] = "helm",
  },
})
