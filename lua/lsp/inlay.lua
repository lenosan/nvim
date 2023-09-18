-- Neovim builtin inlay hints (currently not available in stable version of Neovim)

vim.api.nvim_create_augroup('LspAttach_inlayhints', {})
vim.api.nvim_create_autocmd('LspAttach', {
  group = 'LspAttach_inlayhints',
  callback = function(args)
    if not args or not args.data then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      if vim.lsp['inlay_hint'] ~= nil then
        vim.lsp.inlay_hint(bufnr, true)
      end
    end
  end,
})
