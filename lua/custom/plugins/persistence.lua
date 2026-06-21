-- persistence.nvim: auto-save the session per working directory so you can
--  reopen Neovim and land exactly where you left off.
return {
  'folke/persistence.nvim',
  event = 'BufReadPre',
  opts = {},
  keys = {
    { '<leader>ps', function() require('persistence').load() end, desc = 'Restore [S]ession (this dir)' },
    { '<leader>pl', function() require('persistence').load { last = true } end, desc = 'Restore [L]ast session' },
    { '<leader>pd', function() require('persistence').stop() end, desc = "[D]on't save current session" },
  },
}
