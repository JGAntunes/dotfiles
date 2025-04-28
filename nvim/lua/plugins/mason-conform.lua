return {
	"LittleEndianRoot/mason-conform",
	dependencies = { "williamboman/mason.nvim", "stevearc/conform.nvim" },
	opts = {
		ensure_installed = {
			"gofumpt",
			"goimports",
			"stylua",
			"prettier",
		},
		automatic_installation = true, -- this seems to be broken right now
	},
}
