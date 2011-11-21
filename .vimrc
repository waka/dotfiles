" 非互換モード
set nocompatible

set enc=utf-8
set fenc=utf-8
set fencs=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932
set imi=0
set ims=0

" シンタックスカラー表示を有効にする
syntax on
" 行番号を表示する
set number
" 入力したコマンドをステータスラインに表示
set showcmd
" 位置情報を表示
set ruler
" ステータスラインを表示
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.&fenc.']['.&ff.']'}%=%l,%c%V%8P

" ファイルタイプごとのプラグインを有効にする
filetype on
filetype plugin on
filetype indent on

" 自動インデント
set smartindent
" 対応する括弧を強調表示
set showmatch
" 長い行を折り返さない
"set nowrap
" バックスペースの挙動
set backspace=indent,eol,start
" タブが対応する空白の数
set tabstop=2
set shiftwidth=2
set softtabstop=0
" タブではなく適切な数の空白を使う
set expandtab

set modelines=0

"クリップボードと同期を取る
set clipboard+=unnamed
" 上下から、指定した行数に達したら自動スクロール
set scrolloff=5
" 強化されたコマンドライン補完を使用
set wildmenu
" バッファを保存しないで他のファイルを開けるようにする
set hidden
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列をハイライトしない
set nohlsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" インクリメンタルサーチしない
set noincsearch
"バックアップしない
set nobackup
"スワップファイル作らない
set noswapfile
"変更しててもバッファ消せる
set modifiable
"スワップファイルの置き場所
"set directory=$VIMRUNTIME\tmp
"オートCD
au BufEnter * execute ":lcd " . expand("%:p:h")

"taglist
set tags=tags
let g:tlist_javascript_settings = 'javascript;v:var;c:class;p:prototype;m:method;f:function;o:object'

"fastladder.vim
"let g:fastladder_server = 'http://reader.livedoor.com'

"neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_auto_completion_start_length = 2
let g:neocomplcache_enable_auto_select = 1
"Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
"Recommended key-mappings.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”
inoremap <expr><BS>  neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
"Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

"minibuffer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget=1
let g:miniBufExplSplitToEdge=1
" MiniBufExplorer で GNU screen likeなキーバインド
let mapleader = ""
nmap <S-Space> :MBEbp<CR>
nmap <Space> :MBEbn<CR>
nnoremap <C-X><C-N> :new<CR>
nnoremap <C-X><C-K> :bd<CR>
let mapleader = '\'

"changelog
let g:changelog_timeformat = '%Y-%m-%d'
let g:changelog_username = 'wakahara <y.wakahara@gmail.com>'

"as3 syntax
au BufNewFile,BufRead *.as    set ft=actionscript
"au BufNewFile,BufRead *.mxml  setf mxml
"au FileType actionscript :set dictionary=/usr/share/vim/vim71/dict/actionscript3.dict

"perl syntax
au BufNewFile,BufRead *.pl    set shiftwidth=4 | set expandtab
au BufNewFile,BufRead *.pm    set shiftwidth=4 | set expandtab

"scala syntax
au BufNewFile,BufRead *.scala set ft=scala

"javascript syntax
au BufNewFile,BufRead *.js    set shiftwidth=4 | set expandtab
au BufNewFile,BufRead *.htc   set shiftwidth=4 | set expandtab
au BufNewFile,BufRead *.htc   set ft=javascript

"html syntax
au BufNewFile,BufRead *.html  set shiftwidth=2 | set expandtab
au BufNewFile,BufRead *.mt    set ft=html
au BufNewFile,BufRead *.ftl   set ft=html | set shiftwidth=2


" 補完候補の色づけ for vim7
hi Pmenu ctermbg=8
hi PmenuSel ctermbg=12
hi PmenuSbar ctermbg=0

nnoremap <D-¥> \

" 表示行単位で移動
nnoremap j gj
nnoremap k gk

" encoding
nmap ,U :set fileencoding=utf-8<CR>
nmap ,E :set fileencoding=euc-jp<CR>
nmap ,S :set fileencoding=cp932<CR>

"reload file with given encoding
nmap =U :e ++enc=utf8<CR>
nmap =S :e ++enc=sjis<CR>
nmap =E :e ++enc=euc-jp<CR>
nmap =J :e ++enc=iso-2022-jp<CR>

" format
nmap ,W :set ff=dos<CR>
nmap ,L :set ff=unix<CR>

" font
"set guifont=Osaka−等幅:h11

" コマンドモードで Emacs キーバインド
cmap <C-A> <Home>
cmap <C-F> <Right>
cmap <C-B> <Left>
cmap <C-D> <Delete>
cmap <Esc>b <S-Left>
cmap <Esc>f <S-Right>

" タブで、補完
"imap <TAB> <C-X><C-O>

" ペースト時にオートインデントを無効に 
"set paste

set showtabline=0

" vimgdb
":syntax enable			" enable syntax highlighting
":set previewheight=12		" set gdb window initial height
":run macros/gdb_mappings.vim	" source key mappings listed in this
    				" document
":set asm=0				" don't show any assembly stuff
":set gdbprg=gdb		" set GDB invocation string (default 'gdb')

colorscheme railscasts
set t_Co=256

"デフォルトの設定
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
