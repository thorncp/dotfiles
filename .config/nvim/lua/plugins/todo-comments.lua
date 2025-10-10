return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = false,
    highlight = {
      keyword = "bg", -- don't highlight the leading/trailing characters
      after = "", -- don't highlight the rest of the comment
    }
  }
}
