-- snacks.nvim: a bundle of quality-of-life modules from folke.
--  Enabled here: a start dashboard, big-file handling, faster file opening,
--  a notification UI, indent guides, and cursor-word highlighting.
return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    notifier = { enabled = true },
    dashboard = { enabled = true },
    indent = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    { '<leader>n', function() require('snacks').notifier.show_history() end, desc = '[N]otification history' },
    { '<leader>un', function() require('snacks').notifier.hide() end, desc = 'Dismiss [N]otifications' },
  },
}
