-- toggleterm.nvim: a real toggle-able terminal, plus a floating lazygit window.
--  <c-\> toggles a terminal; <leader>gg opens lazygit (requires the `lazygit`
--  binary on PATH: `brew install lazygit`).
return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    open_mapping = [[<c-\>]],
    direction = 'float',
    float_opts = { border = 'curved' },
  },
  keys = {
    { '<c-\\>', desc = 'Toggle terminal' },
    {
      '<leader>gg',
      function()
        local Terminal = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new {
          cmd = 'lazygit',
          direction = 'float',
          hidden = true,
          float_opts = { border = 'curved' },
        }
        lazygit:toggle()
      end,
      desc = 'Lazy[g]it',
    },
  },
}
