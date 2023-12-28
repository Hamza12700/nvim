local buitin = require("telescope.builtin")

vim.keymap.set('n', '<leader>pf', buitin.find_files, {})
vim.keymap.set('n', '<leader>?', buitin.oldfiles, {})
vim.keymap.set('n', '<leader>b', buitin.buffers, {})
vim.keymap.set('n', '<C-p>', buitin.git_files, {})
vim.keymap.set('n', '<leader>ps', buitin.live_grep, {})
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

vim.keymap.set('n', '<leader>/', function ()
	buitin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 14,
		previewer = false
	}))
end, {})

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")
