"---------------
" 全体
"---------------

"非互換モード
set nocompatible

"文字コード
set enc=utf-8
set fenc=utf-8
set fencs=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932

"IME
set imi=0
set ims=0

"クリップボードと同期を取る
set clipboard+=unnamed


"---------------
" デフォルト設定
"---------------

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


"---------------
" 表示
"---------------

"行番号を表示する
set number

"モードラインを書く行数
set modelines=0

"タブラインを非表示
set showtabline=0


"---------------
" 編集
"---------------

"自動インデント
set smartindent

"ペースト時にオートインデントを無効に 
"set paste

"バックスペースの挙動
set backspace=indent,eol,start

"ファイル中のタブ文字が対応する空白の数
set tabstop=2

"インデントは空白2つ
set shiftwidth=2

"タブが入力されたときの空白の数
set softtabstop=0

"タブではなく適切な数の空白を使う
set expandtab

"対応する括弧を強調表示
set showmatch

"長い行を折り返さない
"set nowrap

"上下から、指定した行数に達したら自動スクロール
set scrolloff=5


"---------------
" ファイル
"---------------

"バックアップしない
set nobackup

"スワップファイル作らない
set noswapfile

"変更しててもバッファ消せる
set modifiable

"バッファを保存しないで他のファイルを開けるようにする
set hidden

"オートCD
au BufEnter * execute ":lcd " . expand("%:p:h")



"---------------
" 検索
"---------------

"インクリメンタルサーチしない
set noincsearch

"検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase

"検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

"検索文字列をハイライトしない
set nohlsearch

"検索時に最後まで行ったら最初に戻る
set wrapscan


"---------------
" ステータスライン
"---------------

"ステータスラインを表示
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.&fenc.']['.&ff.']'}%=%l,%c%V%8P

"位置情報を表示
set ruler

"入力したコマンドをステータスラインに表示
set showcmd

"強化されたコマンドライン補完を使用
set wildmenu


"---------------
" カラーリング
"---------------

"256色を使う
set t_Co=256

"シンタックスカラー表示を有効にする
syntax on

"カラーテーマ
colorscheme railscasts

"補完候補の色づけ for vim7
hi Pmenu ctermbg=8
hi PmenuSel ctermbg=12
hi PmenuSbar ctermbg=0


"---------------
" キーマップ
"---------------

nnoremap <D-¥> \

"表示行単位で移動
nnoremap j gj
nnoremap k gk

"ファイルの文字コードを変更
nmap ,U :set fileencoding=utf-8<CR>
nmap ,E :set fileencoding=euc-jp<CR>
nmap ,S :set fileencoding=cp932<CR>

"ファイルの文字コードを指定して開き直す
nmap =U :e ++enc=utf8<CR>
nmap =S :e ++enc=sjis<CR>
nmap =E :e ++enc=euc-jp<CR>
nmap =J :e ++enc=iso-2022-jp<CR>

"ファイルの改行コードを変更
nmap ,W :set ff=dos<CR>
nmap ,L :set ff=unix<CR>

"コマンドモードで Emacs キーバインド
cmap <C-A> <Home>
cmap <C-F> <Right>
cmap <C-B> <Left>
cmap <C-D> <Delete>
cmap <Esc>b <S-Left>
cmap <Esc>f <S-Right>


"---------------
" ファイルタイプ設定
"---------------

"ファイルタイプごとのプラグインを有効にする
filetype on
filetype plugin on
filetype indent on

"HTML
au BufNewFile,BufRead *.html set shiftwidth=2 | set expandtab

"CSS
au BufNewFile,BufRead *.css  set shiftwidth=2 | set expandtab
au BufNewFile,BufRead *.scss set shiftwidth=2 | set expandtab

"JavaScript
au BufNewFile,BufRead *.js     set shiftwidth=2 | set expandtab
au BufNewFile,BufRead *.coffee set ft=javascript | set shiftwidth=2 | set expandtab

"ActionScript3
au BufNewFile,BufRead *.as   set ft=actionscript | shiftwidth=4 | set expandtab
au BufNewFile,BufRead *.mxml set ft=mxml

"Perl
au BufNewFile,BufRead *.pl set shiftwidth=4 | set expandtab
au BufNewFile,BufRead *.pm set shiftwidth=4 | set expandtab

"Ruby
au BufNewFile,BufRead *.rb       set shiftwidth=2 | set expandtab
au BufNewFile,BufRead *.Gemfile  set ft=ruby | set shiftwidth=2 | set expandtab
au BufNewFile,BufRead *.Rakefile set ft=ruby | set shiftwidth=2 | set expandtab


"---------------
" Neocomplcache
"---------------

let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_auto_completion_start_length = 2
let g:neocomplcache_enable_auto_select = 1

""Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()

""Recommended key-mappings.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”
inoremap <expr><BS>  neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

""Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS


"---------------
" MiniBufExplorer
"---------------

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget=1
let g:miniBufExplSplitToEdge=1

""GNU screen likeなキーバインド
let mapleader = ""
nmap <S-Space> :MBEbp<CR>
nmap <Space> :MBEbn<CR>
nnoremap <C-X><C-N> :new<CR>
nnoremap <C-X><C-K> :bd<CR>
let mapleader = '\'


"---------------
" RagTag
"---------------

let g:ragtag_global_maps = 1
