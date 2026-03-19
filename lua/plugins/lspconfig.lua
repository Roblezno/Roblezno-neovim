return {
  -- Mason para instalar lsp en nvim de forma aislada al resto del PC
  -- Si hago un port a otro ordenador y tengo mason configurado
  -- no tengo que instalar a mano cada lsp en el ordenador nuevo
  {
    "mason-org/mason.nvim",
    opts = {}
  },

  -- lspconfig tiene config básica para iniciar un lsp
  {
    "neovim/nvim-lspconfig",
  },

  -- mason-lspconfig hace de puente entre los lsp y nvim
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig"
    },
    config = function()
      -- AJUSTES ESPECÍFICOS (Antes de arrancar los servidores)
      -- Usamos la API nativa de Neovim 0.11 para modificar servidores concretos
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } }
          }
        }
      })

      -- ARRANQUE AUTOMÁTICO
      -- En la versión 2.0+, al llamar a .setup(), mason-lspconfig
      -- automáticamente ejecuta vim.lsp.enable() para todo lo que esté instalado.
      -- No hacen falta setup handlers adicionales
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "bashls",
          "r_language_server",
          "marksman"
        },
      })
    end
  }
}
