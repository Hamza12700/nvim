local builtin = require("telescope.builtin")
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
			},
		},
		file_ignore_patterns = {
			"_templ.go"
		}
	},
})

---@param key string
---@param func string|function
local function keyset(key, func)
	vim.keymap.set("n", key, func)
end

keyset("<leader>sf", builtin.find_files)
keyset("<leader>?", builtin.oldfiles)
keyset("<leader>b", builtin.buffers)
keyset("<C-p>", builtin.git_files)
keyset("<leader>ps", builtin.live_grep)
keyset("<leader>sd", builtin.diagnostics)

keyset("<leader>ss", builtin.builtin)
keyset("<leader>sh", builtin.help_tags)
keyset("<leader>sw", builtin.grep_string)
keyset("<leader>sk", builtin.keymaps)
keyset("<leader>sr", builtin.resume)
keyset("<leader>sn", function()
	builtin.find_files { cwd = vim.fn.stdpath("config") }
end)

keyset('<leader>/', function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 14,
		previewer = false
	}))
end)

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")
