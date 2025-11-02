return {
   {
      "nvim-treesitter/nvim-treesitter",
      branch = 'master',
      lazy = false,
      build = ":TSUpdate"
   },

   {
      "rebelot/kanagawa.nvim",
      lazy = false,
      priority = 1000,
      config = function()
         vim.cmd.colorscheme("kanagawa-dragon")
      end
   },

   "sindrets/diffview.nvim",

   {
      "ggandor/leap.nvim",
      config = function()
         require("leap").create_default_mappings()
      end
   },

   {
      "ThePrimeagen/harpoon",
      dependencies = { "nvim-lua/plenary.nvim" }
   },

   {
      -- Set lualine as statusline
      "nvim-lualine/lualine.nvim",
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
