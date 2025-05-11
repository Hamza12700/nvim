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

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
   pattern = { "*.md", "*.txt", "*" },
   callback = function()
      if vim.fn.expand("%:e") == "" then
         vim.opt.spell = true
      end
   end
})

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

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
   local nmap = function(keys, func, desc)
      if desc then
         desc = "LSP: " .. desc
      end

      vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
   end

   local builtin = require("telescope.builtin")

   nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
   nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
   nmap("<leader>gs", builtin.git_files, "[G]it files [S]earch")

   nmap("<leader>D", builtin.lsp_type_definitions, "Type [D]efinition")
   nmap("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
   nmap("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")
   nmap("gr", builtin.lsp_references, "[G]oto [R]eferences")
   nmap("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
   nmap("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

   -- See `:help K` for why this keymap
   nmap("K", vim.lsp.buf.hover, "Hover Documentation")
   nmap("<c-k>", vim.lsp.buf.signature_help, "Signature Documentation")

   nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
   nmap("<leader>o", vim.lsp.buf.format, "Format")
end

-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require("mason").setup()
require("mason-lspconfig").setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup()

local cmp = require("cmp")
cmp.setup({
   mapping = cmp.mapping.preset.insert({
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
   }),
})
