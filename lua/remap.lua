-- Use <space> as leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_localrmdir='rm -rf'

vim.keymap.set("n", "<leader>nf", vim.cmd.Explore)
vim.keymap.set("n", "<leader>ns", vim.cmd.Sexplore)
vim.keymap.set("n", "<leader>nv", vim.cmd.Vexplore)

-- TODO: Fix this
--vim.g.netrw_list_hide = "\(^\|\s\s\)\zs\.\S\+"

