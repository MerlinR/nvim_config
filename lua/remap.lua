-- Visual mode move chunks easier
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- Nicer ctrl-d / ctrl-u page moving
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- nicer find next
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "n", "Nzzzv")

-- Leader paste over visual without storing visual
vim.keymap.set("x", "<leader>p", "\"_dP")

-- GIT
vim.keymap.set("n", "<leader>gd", "<Cmd>Gitsigns diffthis<CR>")
vim.keymap.set("n", "<leader>gv", "<Cmd>Gitsigns preview_hunk<CR>")
vim.keymap.set("n", "<leader>gr", "<Cmd>Gitsigns reset_hunk<CR>")

vim.keymap.set("n", "<leader>gh", "<Cmd>DiffviewOpen<CR>")


