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
      -- Función para detectar el entorno de conda activo
      local function get_python_path(workspace)
        if vim.env.CONDA_PREFIX then
          return vim.env.CONDA_PREFIX .. '/bin/python'
        end
        return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
      end


      -- AJUSTES ESPECÍFICOS (Antes de arrancar los servidores)
      -- Usamos la API nativa de Neovim 0.11 para modificar servidores concretos
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } }
          }
        }
      })

      vim.lsp.config("pyright", {
        on_new_config = function(new_config, new_root_dir)
          -- Aseguramos que las tablas existan para evitar errores
          new_config.settings = new_config.settings or {}
          new_config.settings.python = new_config.settings.python or {}
          
          -- Asignamos la ruta detectada
          new_config.settings.python.pythonPath = get_python_path(new_root_dir)
        end,
      })


      -- Pyright config para cargar python en el entorno de conda activo
      -- on_new_config para inyectar la ruta de python justo antes de que arranque

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
