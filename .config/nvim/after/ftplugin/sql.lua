local db_path = ".git/safe/../../bin/db"
local map_opts = { buffer = true, noremap = true }

if vim.fn.filereadable(db_path) == 1 then
  vim.keymap.set("n", "<leader>x", function()
    local file = vim.fn.expand("%:p") -- get full path to current file
    vim.cmd("tabnew")                 -- open new tab
    vim.cmd("terminal clear; bin/db < " .. vim.fn.shellescape(file))
  end, map_opts)
else
  vim.keymap.set("n", "<leader>x", [[<cmd>echo "Can't find .git/safe/../../bin/db"<CR>]], map_opts)
end
