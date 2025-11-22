return {
  {
    'nvim-telescope/telescope.nvim', tag = 'v0.1.9',
     dependencies = { 'nvim-lua/plenary.nvim' },
     config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          path_display = { "smart" },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
            },
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim"
          }
        },
        pickers = {
          find_files = {
            theme = "dropdown"
          }
        }
      })

      -- set keymaps
      local builtin = require('telescope.builtin')
      local keymap = vim.keymap
      keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
      keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Telescope live grep' })
      keymap.set('n', '<leader>fc', builtin.grep_string, { desc = 'Find string under cursor in cwd' })
      keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Fuzzy find recent files' })
      keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
     end
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim', build = 'make',
    config = function()
      require('telescope').load_extension("fzf")
    end
  }
}
