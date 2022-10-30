local keymap_options = { noremap = true, silent = true }

-- 表示行単位で移動
vim.api.nvim_set_keymap('n', 'j', 'gj', keymap_options)
vim.api.nvim_set_keymap('n', 'k', 'gk', keymap_options)

-- ファイルの文字コードを変更
vim.api.nvim_set_keymap('n', ',U', ':set fileencoding=utf-8<CR>', keymap_options)
vim.api.nvim_set_keymap('n', ',E', ':set fileencoding=euc-jp<CR>', keymap_options)
vim.api.nvim_set_keymap('n', ',S', ':set fileencoding=cp932<CR>', keymap_options)

-- ファイルの文字コードを変更して開きなおす
vim.api.nvim_set_keymap('n', '=U', ':e ++enc=utf-8<CR>', keymap_options)
vim.api.nvim_set_keymap('n', '=E', ':e ++enc=euc-jp<CR>', keymap_options)
vim.api.nvim_set_keymap('n', '=S', ':e ++enc=cp932<CR>', keymap_options)

-- ファイルの改行コードを変更
vim.api.nvim_set_keymap('n', ',W', ':set ff=dos<CR>', keymap_options)
vim.api.nvim_set_keymap('n', ',L', ':set ff=unix<CR>', keymap_options)

-- MiniBufExplorer
vim.api.nvim_set_keymap('n', '<C-d>', ':BD<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>', ':MBEbn<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-d>', ':MBEbn<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-d>', ':MBEbp<CR>', { noremap = true })
