return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  config = function()
    -- 1. Iniciamos Mason
    require("mason").setup()

    -- 2. Configuramos mason-lspconfig
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls" }, 
    })

    -- 3. Nueva API nativa de Neovim 0.11+ (Adiós a require('lspconfig'))
    -- Primero definimos la configuración específica para el lenguaje (Lua en este caso)
    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } }
        }
      }
    })
    
    -- Luego habilitamos explícitamente el servidor
    vim.lsp.enable('lua_ls')

    -- 4. Atajos de teclado (Keymaps)
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      end,
    })
  end,
}
