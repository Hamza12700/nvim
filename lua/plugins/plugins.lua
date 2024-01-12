return {
	"jiangmiao/auto-pairs",
	{
		"mbbill/undotree",
		config = function ()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup()
		end
	},
	"hrsh7th/cmp-buffer",

	{
		"echasnovski/mini.indentscope",
		config = function ()
			require("mini.indentscope").setup({
				draw = {
					delay = 50
				}
			})
		end
	},

	"tpope/vim-fugitive",
	{
		"ggandor/leap.nvim",
		config = function ()
			require("leap").create_default_mappings()
		end
	},
	"tpope/vim-rhubarb",

	{
		"lewis6991/gitsigns.nvim",
		config = function ()
			require("gitsigns").setup()
		end
	},


	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		config = function() require("lsp_signature").setup({
			hint_prefix = "🢖 "
		}) end
	},

	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" }
	},

	"tpope/vim-sleuth",

	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"j-hui/fidget.nvim",
			"folke/neodev.nvim",
		},
	},

	{
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",

			-- Adds LSP completion capabilities
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",

			-- Adds a number of user-friendly snippets
			"rafamadriz/friendly-snippets",
		},
	},

	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme kanagawa")
		end,
	},

	{
		-- Set lualine as statusline
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},

	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},
	},

	{
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
	},
}
