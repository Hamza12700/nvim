-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
	---@diagnostic disable-next-line: missing-fields
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"c",
			"cpp",
			"go",
			"lua",
			"python",
			"rust",
			"tsx",
			"javascript",
			"typescript",
			"fish",
			"vimdoc",
			"zig",
			"vim",
			"bash",
		},

		additional_vim_regex_highlighting = false,

		-- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
		auto_install = true,

		highlight = { enable = true },
		indent = { enable = true },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<c-space>",
				node_incremental = "<c-space>",
				scope_incremental = "<c-s>",
				node_decremental = "<M-space>",
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
				keymaps = {
					["aa"] = "@parameter.outer",
					["ai"] = "@conditional.outer",
					["af"] = "@function.outer",
					["al"] = "@loop.outer",
					["ia"] = "@parameter.inner",
					["if"] = "@function.inner",
					["a="] = "@assignment.inner",
					["as"] = "@assignment.lhs",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]f"] = "@function.outer",
					["]i"] = "@conditional.outer",
					["]l"] = "@loop.outer",
				},
				goto_next_end = {
					["[f"] = "@function.outer",
					["[i"] = "@conditional.outer"
				},
				goto_previous_start = {
					["]F"] = "@function.outer",
					["]I"] = "@conditional.outer",
				},
				goto_previous_end = {
					["[F"] = "@function.outer",
					["[I"] = "@conditional.outer",
				},
			},
			lsp_interop = {
				enable = true,
				border = 'none',
				floating_preview_opts = {},
				peek_definition_code = {
					["<leader>df"] = "@function.outer",
				},
			}
		},
	})
end, 0)
