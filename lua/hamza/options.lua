local opt = vim.opt

opt.scrolloff = 10
opt.guicursor = ""

-- Set highlight on search
opt.hlsearch = false

vim.cmd("let g:zig_fmt_autosave = 0")
opt.iskeyword:append({"-"})

-- Make line numbers default
vim.wo.number = true
opt.relativenumber = true
opt.backup = false
opt.swapfile = false
opt.updatetime = 100
opt.showmode = false
opt.signcolumn = "yes"
opt.inccommand = "split"
opt.colorcolumn = "80"

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.softtabstop = 2
opt.smartindent = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
opt.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
opt.termguicolors = true
opt.softtabstop = 2
