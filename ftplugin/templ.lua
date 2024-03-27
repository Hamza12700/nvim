vim.keymap.set("n", "<leader>o", function ()
  vim.cmd("!templ fmt %")
end)

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("Templ Generate", { clear = true }),
  pattern = "*.templ",
  callback = function ()
    vim.cmd(":silent !templ generate -f %")
  end
})
