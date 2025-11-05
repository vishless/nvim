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

vim.g.mapleader = " "
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.pick" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/catppuccin/nvim" },
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

vim.lsp.enable({ "lua_ls", "solargraph" })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>ls', vim.diagnostic.open_float)

-- lsp auto complete
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})
vim.cmd("set completeopt+=noselect")

require "oil".setup()
vim.keymap.set('n', '-', ':Oil<CR>', {desc = 'Open parent directory'})

vim.keymap.set('n', '<leader>gs', ':Git<CR>', { desc = '[G]it [S]tatus' })

vim.cmd("colorscheme catppuccin")
vim.cmd(":hi statusline guibg=NONE")
