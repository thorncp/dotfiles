vim.g.mapleader = " "

vim.opt.autowrite = true

vim.opt.clipboard = "unnamedplus"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.numberwidth = 5

vim.opt.swapfile = false

vim.opt.scrolloff = 2

vim.opt.wrap = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.keymap.set("n", "<C-J>", "<C-W>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-K>", "<C-W>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-H>", "<C-W>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-L>", "<C-W>l", { noremap = true, silent = true })

-- Enable syntax highlighting and filetype detection
vim.cmd("filetype plugin indent on")
