return {
   {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
         library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "luvit-meta/library", words = { "vim%.uv" } },
         },
      },
   },

   { "Bilal2453/luvit-meta", lazy = true },

   {
      "hrsh7th/nvim-cmp",
      opts = function(_, opts)
         opts.sources = opts.sources or {}
         table.insert(opts.sources, {
            name = "lazydev",
            group_index = 0, -- set group index to 0 to skip loading LuaLS completions
         })
      end,
      dependencies = {
         -- Adds LSP completion capabilities
         "hrsh7th/cmp-nvim-lsp",
      }
   },

   "nvim-treesitter/nvim-treesitter-context",
   {
      "NeogitOrg/neogit",
      dependencies = {
         "nvim-lua/plenary.nvim",
         "sindrets/diffview.nvim",

         "nvim-telescope/telescope.nvim",
      },
      config = function()
         require("neogit").setup({
            integrations = {
               telescope = true,
               diffview = true
            }
         })
      end
   },
   {
      "akinsho/git-conflict.nvim",
      version = "*",
      opts = {}
   },
   {
      "rebelot/kanagawa.nvim",
      lazy = false,
      priority = 1000,
      config = function()
         vim.cmd.colorscheme("kanagawa-dragon")
         vim.api.nvim_set_hl(0, "Normal", {})
      end
   },
   "sindrets/diffview.nvim",
   {
      "mbbill/undotree",
      config = function()
         vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
      end
   },
   {
      "ggandor/leap.nvim",
      config = function()
         require("leap").create_default_mappings()
      end
   },

   {
      "echasnovski/mini.indentscope",
      config = function()
         require("mini.indentscope").setup({})
      end
   },

   {
      "ThePrimeagen/harpoon",
      dependencies = { "nvim-lua/plenary.nvim" }
   },

   {
      -- LSP Configuration & Plugins
      "neovim/nvim-lspconfig",
      dependencies = {
         -- Automatically install LSPs to stdpath for neovim
         { "williamboman/mason.nvim", config = true },
         "williamboman/mason-lspconfig.nvim",
      },
   },

   {
      -- Set lualine as statusline
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = {
         options = {
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
         },
         theme = "auto",
         sections = {
            lualine_x = { "filetype" }
         }
      },
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
