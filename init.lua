vim.o.swapfile = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.signcolumn = "yes"
vim.o.expandtab = true
vim.o.wrap = false
vim.o.winborder = "rounded"
vim.o.splitright = true
vim.o.splitbelow = true
vim.opt.eol = false        -- Don't force newline on write
vim.opt.fixendofline = false  -- Don't automatically fix missing newline

vim.g.mapleader = " "

vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.pick" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/catppuccin/nvim" },
    { src = "https://github.com/airblade/vim-gitgutter" },
    { src = "https://github.com/folke/snacks.nvim" },
    { src = "https://github.com/coder/claudecode.nvim" },
    { src = "https://github.com/nickjvandyke/opencode.nvim" },
})

require('mini.pick').setup()
local pick = require('mini.pick')
vim.keymap.set('n', '<leader>pf', pick.builtin.files, { desc = '[P]roject [F]iles' })
vim.keymap.set('n', '<leader>ps', pick.builtin.grep, { desc = '[P]roject [S]earch' })
vim.keymap.set('n', '<leader>pb', pick.builtin.buffers, { desc = '[P]roject [B]uffers' })
vim.keymap.set('n', '<leader>pw', function()
  pick.builtin.grep({ pattern = vim.fn.expand('<cword>') })
end, { desc = '[P]roject [W]ord under cursor' })
vim.keymap.set('n', '<leader>pg', function()
  if vim.fn.system('git rev-parse --is-inside-work-tree') ~= 'true\n' then
    vim.notify('Not a git repository — showing all files instead', vim.log.levels.WARN)
    return pick.builtin.files()
  end

  pick.start({
    source = { items = vim.fn.systemlist('git ls-files') },
    options = { prompt = 'Git files' },
  })
end, { desc = '[P]roject [G]it files' })

require "oil".setup()
vim.keymap.set('n', '-', ':Oil<CR>', {desc = 'Open parent directory'})

local claude_use_local = false
require("claudecode").setup({})
-- vim.keymap.set('n', '<leader>ct', function()
--   claude_use_local = not claude_use_local
--   local env = claude_use_local and { ANTHROPIC_BASE_URL = "http://localhost:8080", ANTHROPIC_API_KEY = "local" } or nil
--   require("claudecode.terminal").setup(nil, nil, env)
--   vim.notify("Claude: " .. (claude_use_local and "llama.cpp (localhost:8080)" or "default"), vim.log.levels.INFO)
-- end, { desc = 'Toggle Claude backend' })
vim.keymap.set('n', '<leader>cc', '<cmd>ClaudeCode<cr>',            { desc = 'Toggle Claude' })
vim.keymap.set('n', '<leader>cf', '<cmd>ClaudeCodeFocus<cr>',       { desc = 'Focus Claude' })
vim.keymap.set('n', '<leader>cr', '<cmd>ClaudeCode --resume<cr>',   { desc = 'Resume Claude' })
vim.keymap.set('n', '<leader>cC', '<cmd>ClaudeCode --continue<cr>', { desc = 'Continue Claude' })
vim.keymap.set('n', '<leader>cm', '<cmd>ClaudeCodeSelectModel<cr>', { desc = 'Select Claude model' })
vim.keymap.set('n', '<leader>cb', '<cmd>ClaudeCodeAdd %<cr>',       { desc = 'Add current buffer' })
vim.keymap.set('v', '<leader>cs', '<cmd>ClaudeCodeSend<cr>',        { desc = 'Send to Claude' })
vim.keymap.set('n', '<leader>cs', '<cmd>ClaudeCodeTreeAdd<cr>',     { desc = 'Add file (oil)' })
vim.keymap.set('n', '<leader>ca', '<cmd>ClaudeCodeDiffAccept<cr>',  { desc = 'Accept diff' })
vim.keymap.set('n', '<leader>cd', '<cmd>ClaudeCodeDiffDeny<cr>',    { desc = 'Deny diff' })

vim.g.opencode_opts = {}
vim.o.autoread = true
vim.keymap.set({ "n", "t" }, "<leader>oc", function()
  require("opencode").toggle()
end, { desc = "Toggle opencode" })
vim.keymap.set({ "n", "x" }, "<leader>oa", function()
  require("opencode").ask("@this: ", { submit = true })
end, { desc = "Ask opencode" })
vim.keymap.set({ "n", "x" }, "<leader>ox", function()
  require("opencode").select()
end, { desc = "Execute opencode action" })

vim.keymap.set('n', '<leader>gs', ':Git<CR>', { desc = '[G]it [S]tatus' })

vim.cmd("colorscheme catppuccin")
vim.cmd(":hi statusline guibg=NONE")

vim.keymap.set("n", "<leader>do", 'o[ ] ')
vim.keymap.set("n", "<leader>ne", '^r[lrxl^r]<Esc>')