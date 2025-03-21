return {
  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    build = ':TSUpdate',
    cmd = { 'TSUpdateSync' },
    opts = {
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = { enable = false },
      ensure_installed = {
        'norg',
        'norg_meta', -- If errors occurr when opening an norg file try to manually uninstall and install norg and norg_meta
        'go',
        'gomod',
        'gowork',
        'gosum',
        'bash',
        'css',
        -- 'c',
        'cpp',
        'c_sharp',
        'dockerfile',
        'html',
        'javascript',
        'json',
        'lua',
        'python',
        'rust',
        'scss',
        'lua',
        'toml',
        'tsx',
        'typescript',
        'yaml',
        'markdown',
        'markdown_inline',
        'jsdoc',
      },
    },
    dependencies = {
      {
        'windwp/nvim-ts-autotag',
        config = function()
          require('nvim-ts-autotag').setup({
            opts = {
              enable_close = true,
              enable_rename = true,
              enable_close_on_slash = true,
            },
          })
        end,
      },
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        init = function()
          -- disable rtp plugin, as we only need its queries for mini.ai
          -- In case other textobject modules are enabled, we will load them
          -- once nvim-treesitter is loaded
          require('lazy.core.loader').disable_rtp_plugin('nvim-treesitter-textobjects')
          load_textobjects = true
        end,
      },
      {
        'nvim-treesitter/nvim-treesitter-context',
        opts = {
          max_lines = 1,
          trim_scope = 'inner',
        },
      },
    },
    config = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        ---@type table<string, boolean>
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      require('nvim-treesitter.configs').setup(opts)

      if load_textobjects then
        -- PERF: no need to load the plugin, if we only need its queries for mini.ai
        if opts.textobjects then
          for _, mod in ipairs({ 'move', 'select', 'swap', 'lsp_interop' }) do
            if opts.textobjects[mod] and opts.textobjects[mod].enable then
              local Loader = require('lazy.core.loader')
              Loader.disabled_rtp_plugins['nvim-treesitter-textobjects'] = nil
              local plugin = require('lazy.core.config').plugins['nvim-treesitter-textobjects']
              require('lazy.core.loader').source_runtime(plugin.dir, 'plugin')
              break
            end
          end
        end
      end
    end,
  },
}
