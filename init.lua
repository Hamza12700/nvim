require("hamza.remap")
require("hamza.options")
require("hamza.floaterm")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
   local lazyrepo = "https://github.com/folke/lazy.nvim.git"
   local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
   if vim.v.shell_error ~= 1 then
      vim.api.nvim_echo({
         { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
         { out,                            "WarningMsg" },
         { "\nPress any key to exit..." },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
   end
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
   callback = function()
      vim.highlight.on_yank()
   end,
   group = highlight_group,
   pattern = "*",
})

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("mason").setup()
require("mason-lspconfig").setup {
   automatic_enable = true,
   ensure_installed = {},
   handlers = {
      function(server_name)
         require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
         })
      end,
   }
}

local cmp = require("cmp")
cmp.setup({
   mapping = cmp.mapping.preset.insert({
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
   }),
})

local nmap = function(keys, func, desc)
   vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
end

local builtin = require("telescope.builtin")

nmap("<leader>gs", builtin.git_files, "[G]it files [S]earch")
nmap("<leader>D", builtin.lsp_type_definitions, "Type [D]efinition")
nmap("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
nmap("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")
nmap("<leader>gr", builtin.lsp_references, "[G]oto [R]eferences")
nmap("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
nmap("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
