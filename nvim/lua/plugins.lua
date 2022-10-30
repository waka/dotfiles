vim.cmd[[packadd packer.nvim]]

-- Read packages
require('packer').startup(function()
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim', opt = true }
  use { 'tomasr/molokai' }
  use { 'fholgado/minibufexpl.vim' }
  use { 'tpope/vim-ragtag' }
  use { 'leafgarland/typescript-vim' }
end)

-- Molokai
vim.cmd('autocmd ColorScheme * highlight Normal ctermbg=none guibg=none')
vim.cmd('autocmd ColorScheme * highlight NonText ctermbg=none guibg=none')
vim.cmd('colorscheme molokai')

-- Minibufexplorer
vim.g.miniBufExplMapWindowNavVim = 1
vim.g.miniBufExplMapWindowNavArrows = 1
vim.g.miniBufExplMapCTabSwitchBufs = 1
vim.g.miniBufExplModSelTarget = 1
vim.g.miniBufExplSplitToEdge = 1
vim.g.miniBufExplCycleArround = 1
