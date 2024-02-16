local git_worktree = require("git-worktree")
local telescope = require("telescope")
telescope.load_extension("git_worktree")

vim.keymap.set("n", "<leader>gw", function()
	telescope.extensions.git_worktree.git_worktree()
end)

vim.keymap.set("n", "<leader>gc", function()
	telescope.extensions.git_worktree.create_git_worktree()
end)
