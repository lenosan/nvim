return {
  -- Easily change surrounding characters
  -- { 'tpope/vim-surround' }, -- Using mini atm
  -- Auto detect tabstop and shiftwidth
  { 'tpope/vim-sleuth' },
  -- Auto close pairs
  {
    'windwp/nvim-autopairs',
    opts = {
      fast_wrap = {},
      disable_filetype = { 'TelescopePrompt', 'vim' },
    },
  },
}
