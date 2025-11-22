-- Lazy.nvim
require("config.lazy")
require("lsp")

vim.opt.termguicolors = true

-- Mouse Bindings
vim.opt.mouse = 'a'
vim.keymap.set('', '<ScrollWheelDown>', 'j')
vim.keymap.set('', '<ScrollWheelUp>', 'k')

-- Better clipboard
vim.opt.clipboard = "unnamed"

-- Spaces & Tabs
vim.opt.expandtab = true       -- tabs are spaces
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2        -- number of spaces in tab when editing
vim.opt.tabstop = 2            -- number of visual spaces per TAB

-- UI Config
vim.cmd('filetype indent on')  -- load filetype-specific indent files
vim.opt.cursorline = true      -- highlight current line
vim.opt.lazyredraw = true      -- redraw only when we need to
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showcmd = true         -- show command in bottom bar
vim.opt.showmatch = true       -- highlight matching [{()}]

-- Folding
vim.opt.foldenable = true          -- enable folding
vim.opt.foldlevelstart = 10        -- open most folds by default
vim.opt.foldmethod = 'indent'      -- fold based on indent level
vim.opt.foldnestmax = 10           -- 10 nested fold max

-- Persistent Undo
vim.opt.undodir = vim.fn.expand('~/.vim/undodir')
vim.opt.undofile = true

-- Set Hidden Buffer
vim.opt.hidden = true

-- Mappings

-- lazy command mode
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')

-- exit insert mode
vim.keymap.set('i', 'jk', '<Esc>')

-- space open/closes folds
vim.keymap.set('n', '<space>', 'za')

-- highlight last inserted text
vim.keymap.set('n', 'gV', '`[v`]')

-- switch to most recent buffer
vim.keymap.set('n', '<leader>b', ':b#<CR>')

-- Moving lines up or down: https://vim.fandom.com/wiki/Moving_lines_up_or_down
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==')
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==')
vim.keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi')
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")
