vim.opt_local.textwidth = 100

vim.keymap.set("n", "<leader>d", "Obinding.pry<esc>", { buffer = true, noremap = true })

vim.keymap.set("n", "<leader>x", function()
  local file = vim.fn.expand("%:p") -- get full path to current file
  vim.cmd("tabnew")                 -- open new tab
  vim.cmd("terminal ruby " .. vim.fn.shellescape(file))
end, map_opts)


vim.g.splitjoin_ruby_curly_braces = 0
vim.g.splitjoin_ruby_hanging_args = 0
vim.g.splitjoin_ruby_trailing_comma = 0
vim.g.splitjoin_ruby_options_as_arguments = 1
