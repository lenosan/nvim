-- vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  cmd = 'Neotree',
  keys = {
    { '<C-n>', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  config = function()
    require('neo-tree').setup({
      filesystem = {
        -- hijack_netrw_behavior = 'open_current',
        window = {
          mappings = {
            ['<C-n>'] = 'close_window',
            ['o'] = 'open',
          },
        },
      },
      use_popups_for_input = true,
      popup_border_style = 'NC',
    })
  end,
}
