require('nvim-treesitter.configs').setup {
  ensure_installed = { 'lua', 'ruby', 'javascript', 'typescript', 'bash' },
  auto_install = true,
  highlight = {
    enable = true,
  },
}
