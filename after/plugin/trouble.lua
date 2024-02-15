local trouble = require("trouble")

---@param keys string
local function nmap(keys, func)
	vim.keymap.set("n", keys, func, { silent = true })
end

nmap("gr", function()
	trouble.toggle("lsp_references")
end)
nmap("gd", function()
	trouble.toggle("lsp_definitions")
end)
nmap("gI", function()
	trouble.toggle("lsp_implementations")
end)
nmap("tt", function()
	trouble.toggle("workspace_diagnostics")
end)
