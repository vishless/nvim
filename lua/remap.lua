-- Use <space> as leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_localrmdir='rm -rf'

-- TODO: Fix this
--vim.g.netrw_list_hide = "\(^\|\s\s\)\zs\.\S\+"

vim.keymap.set("n", "<leader>do", 'o_ ')
vim.keymap.set("n", "<leader>ne", '^rx: <Esc>:r! date "+[\\%H:\\%M]"<CR>kJA<Esc>$')

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

