"基本的な設定 "--------------------------
"新しい行のインデントを現在行と同じにする
set autoindent

"バックアップファイルのディレクトリを指定する
set backupdir=$HOME/.vimbackup

"クリップボードのレジスタ指定を不要にする
set clipboard=unnamed

"vi互換をオフする
set nocompatible

"スワップファイル用のディレクトリを指定する
set directory=$HOME/.vimbackup

"タブの代わりに空白文字を指定する
set expandtab

set tabstop=2
set shiftwidth=2

"変更中のファイルでも、保存しないで他のファイルを表示する
set hidden

"インクリメンタルサーチを行う
set incsearch

"行番号を表示する
set number

"閉括弧が入力された時、対応する括弧を強調する
set showmatch

"コマンドの表示
set showcmd

"入力モード非表示
set noshowmode

"ステータスラインに文字コードと改行文字を表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"コマンドラインの高さを調整
set cmdheight=1

"新しい行を作ったときに高度な自動インデントを行う
set smarttab

"grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

"backspaceを有効にする
set backspace=indent,eol,start

"検索結果をハイライト表示する
set hlsearch

"検索結果のハイライトをesc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

"undoの設定
silent !mkdir ~/.vim_undo > /dev/null 2>&1
set undofile
set undodir=~/.vim_undo
set ic

"色設定
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termtrans=1
set t_Co=16

"NeoBundleでpluginの設定
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc', {
\    'build' : {
\        'windows' : 'tools\\update-dll-mingw',
\        'mac' : 'make -f make_mac.mak',
\        'linux' : 'make',
\        'unix' : 'gmake',
\    },
\}
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'kana/vim-submode'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'groenewege/vim-less'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'kana/vim-filetype-haskell'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'fatih/vim-go'
NeoBundle 'vim-jp/vim-go-extra'
call neobundle#end()

filetype plugin indent on

"emmet用設定
let g:user_emmet_expandabbr_key = '<c-e>'
let setting = webapi#json#decode(join(readfile(expand('~/.snippets.json')), "\n"))
let setting['lang'] = 'ja'
let g:user_emmet_settings = setting

" 追加キーバインド
" 主に画面分割系
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
" nnoremap sn gt
" nnoremap sp gT
" nnoremap sr <C-w>r
nnoremap s= <C-w>=
" nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
" nnoremap sO <C-w>=
" nnoremap sN :<C-u>bn<CR>
" nnoremap sP :<C-u>bp<CR>
" nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
" nnoremap sq :<C-u>q<CR>
" nnoremap sQ :<C-u>bd<CR>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

" lightline設定(ステータスライン)
let g:lightline = {
  \ 'colorscheme' : 'wombat',
  \}

" vimfiler
command Vf VimFiler -buffer-name=explorer -split -simple -winwidth=45 -toggle -no-quit
" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
let g:vimfiler_safe_mode_by_default = 0

" unite
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')

" javascript
let g:syntastic_javascript_checkers = ['eslint']
let g:SimpleJsIndenter_BriefMode = 1
let g:SimpleJsIndenter_CaseIndentLevel = -1
autocmd FileType javascript
  \ :setl omnifunc=jscomplete#CompleteJS

" neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 0
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell/_hist',
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
" For no inserting <CR> key.
"return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"
" neobundle log
let g:neobundle#log_filename = "~/.vim/neobundle.log"

" vim-go
" let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 0
au FileType go nmap ,gr <Plug>(go-run)
au FileType go nmap ,gb <Plug>(go-build)
au FileType go nmap ,gt <Plug>(go-test)
au FileType go nmap ,gc <Plug>(go-coverage)
au FileType go nmap ,gds <Plug>(go-def-split)
au FileType go nmap ,gdv <Plug>(go-def-vertical)
au FileType go nmap ,gdt <Plug>(go-def-tab)
au BufNewFile,BufRead *.go set sw=4 noexpandtab ts=4 completeopt=menu,preview

" tab page
" TabLineSel
" hi TabLineSel term=bold cterm=bold,underline ctermfg=5

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'.  s:SID_PREFIX() .  'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
map    [Tag] <Nop>
map    s [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]t :tablast <bar> :tabnew<CR>
" tt 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ
