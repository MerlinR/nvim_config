require('nvim-treesitter.configs').setup {
    ensure_installed = { 'vim', 'vimdoc', 'lua', 'cpp', 'python', 'dockerfile'},
    auto_install = false,
    highlight = { enable = true },
    indent = { enable = true },
}
