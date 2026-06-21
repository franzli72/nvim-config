-- Flutter / Dart support via flutter-tools.nvim.
--  Dart "linting" is provided by the Dart Analysis Server (the LSP), which
--  ships with the Flutter SDK and reads each project's analysis_options.yaml
--  (e.g. `include: package:flutter_lints/flutter.yaml`). flutter-tools sets up
--  that LSP for us, so dartls is NOT added to the mason-managed servers table
--  in init.lua (it isn't a Mason package).
--
--  Device/emulator pickers use vim.ui.select, which telescope-ui-select already
--  prettifies. Hot reload runs automatically on save by default.
return {
  'akinsho/flutter-tools.nvim',
  ft = { 'dart' },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    lsp = {
      -- Broadcast blink.cmp's extra completion capabilities to dartls.
      capabilities = function()
        return require('blink.cmp').get_lsp_capabilities()
      end,
      settings = {
        showTodos = true,
        completeFunctionCalls = true,
        renameFilesWithClasses = 'prompt',
        updateImportsOnRename = true,
      },
    },
  },
  keys = {
    { '<leader>Fr', '<cmd>FlutterRun<cr>', desc = 'Flutter: [R]un' },
    { '<leader>FR', '<cmd>FlutterRestart<cr>', desc = 'Flutter: Hot [R]estart' },
    { '<leader>Fl', '<cmd>FlutterReload<cr>', desc = 'Flutter: Hot Re[l]oad' },
    { '<leader>Fq', '<cmd>FlutterQuit<cr>', desc = 'Flutter: [Q]uit' },
    { '<leader>Fd', '<cmd>FlutterDevices<cr>', desc = 'Flutter: [D]evices' },
    { '<leader>Fe', '<cmd>FlutterEmulators<cr>', desc = 'Flutter: [E]mulators' },
    { '<leader>Fo', '<cmd>FlutterOutlineToggle<cr>', desc = 'Flutter: [O]utline toggle' },
    { '<leader>Fc', '<cmd>FlutterLogClear<cr>', desc = 'Flutter: [C]lear log' },
  },
}
