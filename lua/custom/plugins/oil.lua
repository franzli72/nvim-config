-- oil.nvim: edit your filesystem like a normal buffer. `-` opens the parent dir.
return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    view_options = { show_hidden = true },
  },
  dependencies = { { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font } },
  -- Load on startup so it can hijack netrw when opening a directory.
  lazy = false,
  keys = {
    { '-', '<cmd>Oil<cr>', desc = 'Open parent directory (Oil)' },
  },
}
