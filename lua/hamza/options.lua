local opt = vim.opt

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.textwidth = 90

vim.api.nvim_create_autocmd("BufEnter", {
   pattern = "*",
   callback = function()
      vim.opt_local.shiftwidth = 2
      vim.opt_local.softtabstop = 2
      vim.opt_local.tabstop = 2
   end,
})

vim.api.nvim_create_autocmd("FileType", {
   pattern = "*",
   callback = function()
      vim.opt_local.formatoptions:remove("o")
   end
})

opt.nu = false
opt.rnu = false
opt.smartindent = true

opt.scrolloff = 10
opt.guicursor = ""

-- Set highlight on search
opt.hlsearch = true

vim.cmd("let g:zig_fmt_autosave = 0")
vim.diagnostic.config({ virtual_text = false })

-- Make line numbers default
opt.backup = false
opt.swapfile = false
opt.updatetime = 100

opt.signcolumn = "no"
opt.inccommand = "split"

-- Don't use the mode, since it's already in status-line
opt.showmode = false

-- Enable nerd fonts
vim.g.have_nerd_font = true


-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

opt.termguicolors = true
opt.softtabstop = 2

