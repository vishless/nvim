
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.linespace = 10
vim.opt.expandtab = true

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = a

vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- split windows to the right and bottom
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.fixendofline = false


vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 2
vim.opt.sidescroll = 4

-- Write before some operations
vim.opt.autowrite = true

vim.opt.wrap = false

-- Decrease update time and timeoutlen
vim.opt.updatetime = 750
vim.opt.timeoutlen = 750

vim.opt.foldmethod = false

-- Set highlight on search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Enable break indent
vim.opt.breakindent = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

-- Konsole terminal doesn't support this yet
-- vim.o.termguicolors = true

vim.opt.softtabstop = 4

vim.opt.isfname:append("@-@")

-- 120 is the max line width recommended by rubocop
vim.opt.colorcolumn = "120"
