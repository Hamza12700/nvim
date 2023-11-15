return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = {
          skip = true,
        },
      })

      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
      ██╗  ██╗ █████╗ ███╗   ███╗███████╗ █████╗ 
      ██║  ██║██╔══██╗████╗ ████║╚══███╔╝██╔══██╗
      ███████║███████║██╔████╔██║  ███╔╝ ███████║
      ██╔══██║██╔══██║██║╚██╔╝██║ ███╔╝  ██╔══██║
      ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗██║  ██║
      ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
      ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
