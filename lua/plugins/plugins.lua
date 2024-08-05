return {
  "tpope/vim-sleuth",
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",

      "nvim-telescope/telescope.nvim",
      "ibhagwan/fzf-lua",
    },
    opts = {
      telescope_sorter = function ()
        return require("telescope").extensions.fzf.native_fzf_sorter()
      end
    }
  },
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    opts = {}
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
  },
  {
    "HoNamDuong/hybrid.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("hybrid")
    end
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },
  "sindrets/diffview.nvim",
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
  {
    "mbbill/undotree",
    config = function()
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
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").create_default_mappings()
    end
  },

  -- {
  --   "Exafunction/codeium.vim",
  --   event = "BufEnter",
  -- },

  {
    "echasnovski/mini.indentscope",
    config = function()
      require("mini.indentscope").setup({})
    end
  },

  {
    "folke/trouble.nvim",
    config = function()
      vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle workspace_diagnostics<cr>")
    end
  },

  "hrsh7th/cmp-buffer",
  "ThePrimeagen/git-worktree.nvim",

  "tpope/vim-fugitive",

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      vim.keymap.set("n", "<leader>gg", ":Gitsigns preview_hunk<CR>")
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
      "j-hui/fidget.nvim",
      "folke/neodev.nvim",
    },
  },

  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp"
  },

  {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      "saadparwaiz1/cmp_luasnip",

      -- Adds LSP completion capabilities
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",

      -- Adds a number of user-friendly snippets
      "rafamadriz/friendly-snippets",
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
