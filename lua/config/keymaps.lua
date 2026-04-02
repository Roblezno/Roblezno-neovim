-- ================================================================================================
-- TITLE: NeoVim keymaps
-- ABOUT: sets some quality-of-life keymaps
-- ================================================================================================

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", "<Cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Splitting & Resizing
vim.keymap.set("n", "<leader>sv", "<Cmd>vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<Cmd>split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", "<Cmd>resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Quick config editing
-- vim.keymap.set("n", "<leader>rc", "<Cmd>e ~/.config/nvim/init.lua<CR>", { desc = "Edit config" })

-- File Explorer
-- vim.keymap.set("n", "<leader>m", "<Cmd>NvimTreeFocus<CR>", { desc = "Focus on File Explorer" })
vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

-- markdown quick block creation
vim.keymap.set('n', '<m-i>', 'i```{}<cr>```<esc>O', {desc = '[i]nsert code chunk'})

-- Force hints to display with base config, not affected by quarto formatting
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Display floating window hint' })


-- NOTE: Keymaps para manejo de terminales

-- Este atajo invoca el menú de configuración nativo de Slime
vim.keymap.set("n", "<leader>rs", "<Plug>SlimeConfig", { desc = "Seleccionar terminal destino (Slime)" })
-- Ejecutar bloques de código seleccionados en modo VISUAL
vim.keymap.set("x", "<leader>rv", "<Plug>SlimeRegionSend", { desc = "Ejecutar selección visual", silent = true })
-- Ejecutar líneas de código en modos NORMAL y INSERT 
vim.keymap.set({"n", "x"}, "<leader>rl", "<Plug>SlimeSend<CR>" ,{ desc = "Ejecutar línea actual", silent = true })
-- Salir del Modo terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Salir del modo terminal al modo normal' })
-- Terminal normal
vim.keymap.set('n', '<leader>tvn', '<cmd>vsplit | term<CR>', { desc = 'Terminal normal en vertical' })
vim.keymap.set('n', '<leader>thn', '<cmd>split | term<CR>', { desc = 'Terminal normal en horizontal' })

-- Terminal de R
vim.keymap.set('n', '<leader>tvr', '<cmd>vsplit | term R<CR>', { desc = 'Terminal de R en vertical' })
vim.keymap.set('n', '<leader>thr', '<cmd>split | term R<CR>', { desc = 'Terminal de R en horizontal' })

-- Terminal de Python
vim.keymap.set('n', '<leader>tvp', '<cmd>vsplit | term python3<CR>', { desc = 'Terminal de Python en vertical' })
vim.keymap.set('n', '<leader>thp', '<cmd>split | term python3<CR>', { desc = 'Terminal de Python en horizontal' })

-- Terminal Flotante
vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm<CR>', {desc = 'Terminal Flotante'})
