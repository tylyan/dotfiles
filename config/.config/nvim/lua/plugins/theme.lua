return {
  -- {
  --   'arcticicestudio/nord-vim',
  --   priority = 1000,
  --   lazy = false,
  --   config = function()
  --     vim.cmd([[colorscheme nord]])

  --     -- Color
  --     vim.opt.background = 'dark'
  --     vim.opt.termguicolors = true
  --     vim.cmd('syntax enable')
  --   end
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd([[colorscheme catppuccin-macchiato]])

      -- Color
      vim.opt.background = 'dark'
      vim.opt.termguicolors = true
      vim.cmd('syntax enable')
    end
  }
}
