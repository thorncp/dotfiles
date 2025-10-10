vim.opt_local.spell = true
vim.opt_local.textwidth = 72

vim.api.nvim_set_hl(0, "gitcommitComment", {})
vim.cmd.syntax("match gitcommitComment '^;.*'")
