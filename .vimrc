"--------------------------
"基本的な設定
"--------------------------
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

"タブの代わりに空白2文字分
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

"新しい行を作ったときに高度な自動インデントを行う
set smarttab

"grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

"検索結果のハイライトをesc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

"undoの設定
silent !mkdir ~/.vim_undo > /dev/null 2>&1
set undofile
set undodir=~/.vim_undo

"色設定
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termtrans=1

"NeoBundleでpluginの設定
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc', {
\    'build' : {
\        'mac' : 'make -f make_mac.mak',
\    },
\}
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'kana/vim-submode'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'

filetype plugin indent on

NeoBundleCheck

"emmet用設定
let g:user_emmet_expandabbr_key = '<c-e>'
let g:user_emmet_setting = {
            \ 'lang':'ja'
            \}

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
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

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
