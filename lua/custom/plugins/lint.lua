-- Linting via nvim-lint. Complements the LSP diagnostics (ruff/basedpyright
--  handle Python directly), covering tools that aren't language servers.
--  Linters are installed by Mason (see mason-tool-installer in init.lua).
return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'
    lint.linters_by_ft = {
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      markdown = { 'markdownlint' },
      make = { 'checkmake' },
    }

    -- Re-lint on these events. Using a dedicated augroup so it's easy to clear.
    local lint_augroup = vim.api.nvim_create_augroup('nvim-lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        -- Only run the linter in buffers backed by a real file.
        if vim.bo.modifiable and vim.bo.buftype == '' then
          lint.try_lint()
        end
      end,
    })
  end,
}
