-- 全体
vim.opt.clipboard = 'unnamed,unnamedplus'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = 'ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932'

-- 表示
vim.opt.ambiwidth = 'double'
vim.opt.modelines = 0
vim.opt.number = true

-- カラー
--vim.opt.termguicolors = true

-- 編集
vim.opt.backspace = 'indent,eol,start'
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.showmatch = true
vim.opt.showtabline = 0
vim.opt.smartindent = true
vim.opt.softtabstop = 0
vim.opt.tabstop = 2

-- ファイル
vim.opt.hidden = true
vim.opt.modifiable = true
vim.opt.swapfile = false

-- 検索
vim.opt.incsearch = false
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.smartcase = true
vim.opt.wrapscan = true

-- ステータスライン
vim.opt.laststatus = 2
vim.opt.ruler = true
vim.opt.showcmd = true

-- プラグイン読み込み
require('plugins')
require('keymaps')
