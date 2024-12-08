return {
  -- Language server installer
  { 'williamboman/mason.nvim' },
  -- LSP configuration for mason
  { 'williamboman/mason-lspconfig.nvim' },
  -- LSP
  { 'neovim/nvim-lspconfig' },
  -- Additional LSP support
  { 'nvimtools/none-ls.nvim', dependencies = {
    'nvimtools/none-ls-extras.nvim',
  } },
  -- Documentation Generation (JSDoc etc.)
  {
    'danymat/neogen',
    config = function()
      require('neogen').setup({
        enabled = true,
        snipped_engine = 'luasnip',
      })
    end,
  },
  -- Virtual Types / Inlay hints (only used for some languages that don't natively support inlay hints yet)
  { 'jubnzv/virtual-types.nvim' },
  -- Completion engine
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- LSP status indicators
      {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        event = 'LspAttach',
        config = function()
          require('fidget').setup({
            window = {
              blend = 0,
            },
          })
        end,
      },

      -- Additional lua configuration, makes nvim stuff amazing!
      { 'folke/neodev.nvim', opts = {} },
    },
  },
  -- LSP enhancements
  {
    'nvimdev/lspsaga.nvim',
  },
  -- LSP completion source for cmp
  { 'hrsh7th/cmp-nvim-lsp' },
  -- Snippet engine
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.3',
    dependencies = {
      -- Snippets source for cmp
      { 'saadparwaiz1/cmp_luasnip' },
      -- Predefined snippets
      { 'rafamadriz/friendly-snippets' },
    },
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
      require('luasnip.loaders.from_lua').load({ paths = { './snippets' } })

      require('luasnip').filetype_extend('typescript', { 'tsdoc' })
      require('luasnip').filetype_extend('typescriptreact', { 'tsdoc' })
      require('luasnip').filetype_extend('javascript', { 'jsdoc' })
      require('luasnip').filetype_extend('javascriptreact', { 'jsdoc' })
      require('luasnip').filetype_extend('lua', { 'luadoc' })
      require('luasnip').filetype_extend('python', { 'pydoc' })
      require('luasnip').filetype_extend('rust', { 'rustdoc' })
      require('luasnip').filetype_extend('cs', { 'csharpdoc' })
      require('luasnip').filetype_extend('java', { 'javadoc' })
      require('luasnip').filetype_extend('c', { 'cdoc' })
      require('luasnip').filetype_extend('cpp', { 'cppdoc' })
      require('luasnip').filetype_extend('php', { 'phpdoc' })
      require('luasnip').filetype_extend('kotlin', { 'kdoc' })
      require('luasnip').filetype_extend('ruby', { 'rdoc' })
      require('luasnip').filetype_extend('sh', { 'shelldoc' })
    end,
  }, -- build = 'make install_jsregexp'
  -- Code Action floating window
  -- { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' },
  -- LSP Diagnostic
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },
  -- Commenting
  {
    'numToStr/Comment.nvim',
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    opts = {
      padding = true,
      mappings = {
        basic = true,
        extra = true,
      },
    },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('Comment').setup({
        padding = true,
        sticky = true,
        toggler = {
          line = 'gcc',
          block = 'gbc',
        },
        opleader = {
          line = 'gc',
          block = 'gb',
        },
        extra = {
          above = 'gcO',
          below = 'gco',
          eol = 'gcA',
        },
        mappings = {
          basic = true,
          extra = true,
        },
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end,
  },
  -- Icons for LSP completion items
  { 'onsails/lspkind.nvim' },
  -- Spell checking sources for cmp
  { 'f3fora/cmp-spell' },
  -- OCaml runtime files
  { 'ocaml/vim-ocaml' },
}
