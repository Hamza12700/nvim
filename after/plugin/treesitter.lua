-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
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
					-- You can use the capture groups defined in textobjects.scm
					["aa"] = "@parameter.outer",
					["ia"] = "@parameter.inner",
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
					["a="] = "@assignment.inner",
					["as"] = "@assignment.lhs",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next = {
					["]i"] = "@conditional.outer",
				},
				goto_previous = {
					["[i"] = "@conditional.outer"
				},
				goto_next_start = {
					["]f"] = "@function.outer",
					["]]"] = "@class.outer",
				},
				goto_next_end = {
					["]F"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[f"] = "@function.outer",
					["[["] = "@class.outer",
				},
				goto_previous_end = {
					["[F"] = "@function.outer",
					["[]"] = "@class.outer",
				},
			},
			-- swap = {
			-- 	enable = true,
			-- 	swap_next = {
			-- 		["<leader>a"] = "@parameter.inner",
			-- 	},
			-- 	swap_previous = {
			-- 		["<leader>A"] = "@parameter.inner",
			-- 	},
			-- },
		},
	})
end, 0)
