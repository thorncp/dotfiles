vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.opt.clipboard = "unnamedplus"

-- vim.opt.ignorecase = true
-- vim.opt.smartcase = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.numberwidth = 5

vim.opt.swapfile = false

vim.opt.scrolloff = 2

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.autowrite = true
-- vim.opt.autoread = true
-- vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "VimResized" }, {
--   pattern = "*",
--   command = "checktime",
-- })
-- local uv = vim.loop

-- local sigcont = uv.new_signal()
-- sigcont:start("sigcont", function()
--   vim.schedule(function()
--     vim.cmd("checktime")
--   end)
-- end)
-- local signal = uv.new_signal()
-- uv.signal_start(signal, "sigcont", function(signame)
--   vim.cmd("checktime")
-- end)
-- vim.on_signal(vim.loop.constants.SIGCONT, function()
--   vim.cmd("checktime")
-- end)

vim.keymap.set("n", "<C-J>", "<C-W>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-K>", "<C-W>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-H>", "<C-W>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-L>", "<C-W>l", { noremap = true, silent = true })

-- Map leader key shortcuts for test commands
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>t', ':TestNearest<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>T', ':TestFile<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>a', ':TestSuite<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>l', ':TestLast<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>g', ':TestVisit<CR>', opts)

vim.api.nvim_set_keymap('n', '<CR>', ':nohlsearch<CR><CR>', opts)

-- Enable syntax highlighting and filetype detection
vim.cmd("filetype plugin indent on")

require("config.lazy")

require("onedark").setup {
    style = "warm"
}
require("onedark").load()

if vim.fn.filereadable(".git/safe/../../.nvim.local.lua") == 1 then
  vim.cmd.source(".git/safe/../../.nvim.local.lua")
end

-- vim.g["test#strategy"] = "neovim"
-- vim.g["test#basic#start_normal"] = 1
vim.g["test#ruby#rspec#options"] = {
  nearest = "--format documentation",
  file = "--format documentation",
}

local lspconfig = require('lspconfig')
lspconfig.ruby_lsp.setup({
  init_options = {
    formatter = 'standard',
    linters = { 'standard' },
    addonSettings = {
      ["Ruby LSP Rails"] = {
	enablePendingMigrationsPrompt = false,
      },
    },
  },
  on_attach = function(client, bufnr)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
  end,
})
lspconfig.ts_ls.setup({
  on_attach = function(client, bufnr)
    -- disable autoformatter
    client.server_capabilities.documentFormattingProvider = false
    -- disable auto completion because it's too slow
    client.server_capabilities.completionProvider = nil
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', '')
  end,
})
lspconfig.eslint.setup({
  flags = {
    -- allow_incremental_sync = false,
    -- debounce_text_changes = 1000,
  },
})

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "ruby", "javascript", "typescript", "html", "css", "json", "lua", "vim", "sql"
  },
  highlight = { enable = true },
  indent = { enable = true },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "ruby" },
  callback = function()
    vim.opt_local.indentkeys:remove(".")
  end,
})

require('fzf-lua').setup({'fzf-vim'})
vim.api.nvim_set_keymap('n', '<C-P>', ':FzfLua files<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>k', ':FzfLua grep_cword<CR>', opts)

require("autoread").setup({
  -- Check interval in milliseconds
  interval = 500,
  -- Show notifications when files change
  notify_on_change = true,
  -- How to handle cursor position after reload: "preserve", "scroll_down", or "none"
  cursor_behavior = "preserve",
})
vim.cmd("silent AutoreadOn")
