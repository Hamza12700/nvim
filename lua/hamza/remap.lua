---@param mode string|table
---@param lhs string
---@param rhs string | function
---@param opts table | nil
local function keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap({ "n", "v" }, "gl", "$")
keymap({ "n", "v" }, "gh", "_")
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")
keymap({ "i", "v" }, "<c-c>", "<ESC>")
keymap("t", "<esc><esc>", "<c-\\><c-n>")
keymap("n", "<leader>g", ":Neogit<CR>")
keymap("n", "<leader>vd", ":DiffviewOpen<cr>")
keymap("n", "<leader>cd", ":DiffviewClose<cr>")

-- Clear highlights on search when pressing <Esc> in normal mode
keymap("n", "<esc>", ":nohlsearch<CR>")

-- Hide inline LSP diagnostics
keymap("n", "<leader>ll", function()
  local config = not vim.diagnostic.config()
  vim.diagnostic.config({ virtual_text = config })
end, { desc = "Hide/Show inline LSP Diagnostics" })

-- Diagnostics Set Location-list
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

keymap({ "n", "v" }, "<leader>d", [["_d]])
keymap("x", "<leader>p", [["_dP]])
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])
keymap("n", "<leader>P", [["+p]])
keymap({ "n", "v" }, "<leader>d", [["_d]])
keymap("n", "Q", "<nop>")
keymap("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>")

-- Diagnostic keymaps
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
keymap("n", "<leader>f", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
keymap("i", "<c-a>", vim.lsp.buf.signature_help)
