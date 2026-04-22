return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",   -- Es indispensable especificar la rama main
  lazy = false,      -- Es recomendable que no sea lazy para que cargue los parsers pronto
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    -- 1. INSTALACIÓN DE PARSERS
    -- La vieja tabla `ensure_installed` desaparece. Ahora llamas directamente
    -- a la función install(). Es asíncrona y no hará nada si ya están instalados.
    ts.install({
      "c", "lua", "vim", "vimdoc", "query",
      "javascript", "html", "css", "python", "bash",
      "markdown", "markdown_inline", "r"
    })

    -- 2. ACTIVAR EL RESALTADO DE SINTAXIS
    -- Ya no existe `highlight = { enable = true }`. Ahora debes arrancar
    -- el motor nativo de treesitter de Neovim al abrir los archivos.
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("ActivarTreesitter", { clear = true }),
      pattern = "*", -- Se ejecutará para todos los lenguajes
      callback = function(args)
        -- Usamos pcall para evitar mensajes de error al abrir un archivo 
        -- cuyo lenguaje no tenga parser de treesitter instalado.
        pcall(vim.treesitter.start, args.buf)
      end,
    })

    -- 3. ACTIVAR FOLDING (Opcional)
    -- Puesto que ya no hay configuraciones globales en el plugin, las cosas 
    -- como el plegado de código (folding) se configuran usando opciones nativas:
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt.foldenable = false -- Evita que los archivos se abran con todo plegado
  end
}
