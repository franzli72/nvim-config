-- Python debugging convenience keymaps. The core (nvim-dap, dap-ui, dap-python
--  and debugpy) is already set up by kickstart.plugins.debug; this only adds the
--  test-runner helpers from nvim-dap-python for Python buffers.
return {
  'mfussenegger/nvim-dap-python',
  ft = 'python',
  dependencies = { 'mfussenegger/nvim-dap' },
  keys = {
    {
      '<leader>dt',
      function() require('dap-python').test_method() end,
      desc = 'Debug: [T]est method (Python)',
      ft = 'python',
    },
    {
      '<leader>dc',
      function() require('dap-python').test_class() end,
      desc = 'Debug: Test [C]lass (Python)',
      ft = 'python',
    },
    {
      '<leader>ds',
      function() require('dap-python').debug_selection() end,
      mode = 'v',
      desc = 'Debug: [S]election (Python)',
      ft = 'python',
    },
  },
}
