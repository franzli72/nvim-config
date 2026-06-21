-- Treesitter add-ons that init.lua only hints at:
--  * treesitter-context: keep the current function/class header pinned at the
--    top while you scroll.
--  * treesitter-textobjects: smart motions between functions/classes/params.
--    (Function/class *selection* — af/if, ac/ic — is provided through mini.ai's
--    treesitter integration, configured in init.lua.)
return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = { max_lines = 3 },
    keys = {
      { '<leader>tc', '<cmd>TSContextToggle<cr>', desc = '[T]oggle Treesitter [C]ontext' },
    },
  },
  {
    -- Extends the existing nvim-treesitter spec from init.lua (lazy merges them).
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    opts = {
      textobjects = {
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']f'] = '@function.outer',
            [']c'] = '@class.outer',
            [']a'] = '@parameter.inner',
          },
          goto_next_end = {
            [']F'] = '@function.outer',
            [']C'] = '@class.outer',
          },
          goto_previous_start = {
            ['[f'] = '@function.outer',
            ['[c'] = '@class.outer',
            ['[a'] = '@parameter.inner',
          },
          goto_previous_end = {
            ['[F'] = '@function.outer',
            ['[C'] = '@class.outer',
          },
        },
      },
    },
  },
}
