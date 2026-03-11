return {
    {
      "jpalardy/vim-slime",
      init = function()
        -- Le decimos a slime que use las terminales de Neovim
        vim.g.slime_target = "neovim"
        -- Desactivamos los mapeos por defecto para que no choquen con los nuestros
        vim.g.slime_no_mappings = true 
        -- (Opcional) No preguntar por la terminal destino cada vez si solo hay una
        vim.g.slime_default_config = { jobid = 1 }
      end,
    }
}
