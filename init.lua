vim.o.swapfile = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.signcolumn = "yes"
vim.o.expandtab = true
vim.o.wrap = false
vim.o.winborder = "rounded"

vim.g.mapleader = " "
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

vim.pack.add({
    { src = "https://github.com/vague-theme/vague.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/nvim-mini/mini.pick" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
})

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

require "mini.pick".setup()
vim.keymap.set('n', '<leader>f', ':Pick files<CR>')

require "oil".setup()
vim.keymap.set('n', '-', ':Oil<CR>', {desc = 'Open parent directory'})

require("vague").setup({
    transparent = true,
    style = {
        strings = "none",
    }
})

vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")
