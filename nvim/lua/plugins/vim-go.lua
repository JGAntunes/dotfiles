return {
	"fatih/vim-go",
	build = ":GoUpdateBinaries",
	ft = "go", -- optional: load plugin only for Go files
	init = function()
		-- Disable go-vim auto linting, vet and stuff on save
		-- We're defaulting to using COC vim for it
		vim.g.go_metalinter_autosave = 0
		-- Auto formatting and importing
		vim.g.go_fmt_autosave = 0
		-- vim.g.go_fmt_command = "goimports"
		-- Show function info
		vim.g.go_auto_type_info = 1

		-- Disable the default go def mappings which rely on things such as <C-t>
		vim.g.go_def_mapping_enabled = 0

		-- Go-specific key mappings
		local gogroup = vim.api.nvim_create_augroup("jgantunes.go", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "go",
			group = gogroup,
			desc = "Go-specific key mappings",
			callback = function()
				local opts = { noremap = true, silent = true, buffer = true }
				vim.keymap.set("n", "<leader>t", "<Plug>(go-test)", opts)
				vim.keymap.set("n", "<leader>tf", "<Plug>(go-test-func)", opts)
				vim.keymap.set("n", "<leader>gd", "<Plug>(go-def-split)", opts)
				vim.keymap.set("n", "<leader>gs", "<Plug>(go-def-pop)", opts)
				vim.keymap.set("n", "<leader>gc", "<Plug>(go-callers)", opts)
				vim.keymap.set("n", "<leader>gi", "<Plug>(go-implements)", opts)
				vim.keymap.set("n", "<leader>ge", "<Plug>(go-iferr)", opts)
				vim.keymap.set("n", "<leader>ga", "<Plug>(go-alternate-vertical)", opts)
				vim.keymap.set("n", "<leader>d", ":GoDebugStart<CR>", opts)
				vim.keymap.set("n", "<leader>dt", ":GoDebugTest<CR>", opts)
				vim.keymap.set("n", "<leader>dq", ":GoDebugStop<CR>", opts)
				vim.keymap.set("n", "<leader>dh", ":GoDebugHalt<CR>", opts)
				vim.keymap.set("n", "<leader>db", ":GoDebugBreakpoint<CR>", opts)
				vim.keymap.set("n", "<leader>dn", ":GoDebugNext<CR>", opts)
				vim.keymap.set("n", "<leader>dc", ":GoDebugContinue<CR>", opts)
				vim.keymap.set("n", "<leader>ds", ":GoDebugStep<CR>", opts)
			end,
		})
	end,
}
