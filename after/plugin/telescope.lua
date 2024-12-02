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


keyset('<leader>s/', function()
	builtin.live_grep {
		grep_open_files = true,
		prompt_title = 'Live Grep in Open Files',
	}
end)

keyset("<leader>sf", builtin.find_files)
keyset("<leader>s.", builtin.oldfiles)
keyset("<leader>b", builtin.buffers)
keyset("<C-p>", builtin.git_files)
keyset("<leader>sg", builtin.live_grep)
keyset("<leader>sd", builtin.diagnostics)

keyset("<leader>ss", builtin.builtin)
keyset("<leader>sh", builtin.help_tags)
keyset("<leader>sw", builtin.grep_string)
keyset("<leader>sk", builtin.keymaps)
keyset("<leader>sr", builtin.resume)
keyset("<leader>sn", function()
	builtin.find_files { cwd = vim.fn.stdpath("config") }
end)

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")
