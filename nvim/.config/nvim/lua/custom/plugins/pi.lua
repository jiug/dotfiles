return {
  { 'pablopunk/pi.nvim',
    config = function()
      vim.keymap.set('n', '<leader>ai', ':PiAsk<CR>', { noremap = true, silent = true })
      vim.keymap.set('v', '<leader>ai', ':PiAskSelection<CR>', { noremap = true, silent = true })
    end
  },
}
