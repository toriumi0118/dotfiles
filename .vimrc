" directory settings
" スワップファイル用のディレクトリを指定する
silent !mkdir $HOME/.vim/swp > /dev/null 2>&1
silent !mkdir $HOME/.vim/undo > /dev/null 2>&1
set directory=$HOME/.vim/swp
set undofile " undoを使う
set undodir=$HOME/.vim/undo
set nobackup

" controll settings
set nocompatible " vi互換をオフする
set expandtab    " タブの代わりに空白文字を指定する
set tabstop=2
set shiftwidth=2
set hidden       " 変更中のファイルでも、保存しないで他のファイルを表示する
set incsearch    " インクリメンタルサーチを行う
set ic           " ignore case

" keymap settings
"" 検索結果のハイライトをesc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>
"" 主に画面分割系
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap s= <C-w>=
nnoremap so <C-w>_<C-w>|
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap s> <C-w>>
nnoremap s< <C-w><
nnoremap s+ <C-w>+
nnoremap s- <C-w>-
"" Tab
map [Tab] <Nop>
map s [Tab]
for n in range(1, 9)
  execute 'nnoremap <silent> [Tab]'.n ':<C-u>tabnext'.n.'<CR>'
endfor
map <silent> [Tab]t :tablast <bar> :tabnew<CR>
map <silent> [Tab]x :tabclose<CR>
map <silent> [Tab]n :tabnext<CR>
map <silent> [Tab]p :tabprevious<CR>

" plugin installation
call plug#begin('~/.vim/plugged')
  "" XXX: Make sure you use single quotes
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'tpope/vim-surround'
  Plug 'mattn/emmet-vim'
  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' " for snippet
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'groenewege/vim-less'
  Plug 'rking/ag.vim'
  Plug 'fatih/vim-go', { 'for': 'go', 'tag': '*' }
  Plug 'vim-jp/vim-go-extra', { 'for': 'go' }
  Plug 'kana/vim-filetype-haskell', { 'for': 'haskell' }
  Plug 'itchyny/vim-haskell-indent', { 'for': 'haskell' }
  Plug 'mxw/vim-jsx', { 'for': 'jsx' }
  Plug 'othree/yajs.vim'
  Plug 'slim-template/vim-slim', { 'for': 'slim' }
  Plug 'scrooloose/nerdtree'
call plug#end()

" display settings
"" ステータスラインに文字コードと改行文字を表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set ambiwidth=double           " バルチバイトでずれるのを修正
set autoindent                 " 新しい行のインデントを現在行と同じにする
set clipboard=unnamed          " クリップボードのレジスタ指定を不要にする
set number                     " 行番号を表示する
set showmatch                  " 閉括弧が入力された時、対応する括弧を強調する
set showcmd                    " コマンドの表示
set cmdheight=1                " コマンドラインの高さを調整
set smarttab                   " 新しい行を作ったときに高度な自動インデントを行う
set smartcase                  " smartcase
set backspace=indent,eol,start " backspaceを有効にする
set hlsearch                   " 検索結果をハイライト表示する
syntax enable                  " 色設定
colorscheme jellybeans
set showtabline=2              " 常にタブラインを表示

" plugin settings
"" easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
"" emmet
let g:user_emmet_expandabbr_key = '<c-e>'
"" lightline
let g:lightline = { 'colorscheme' : 'jellybeans' }
"" vim-go
let g:go_fmt_autosave = 0
au BufNewFile,BufRead *.go set sw=4 noexpandtab ts=4 completeopt=menu,preview
au FileType go nmap ,gr <Plug>(go-run)
au FileType go nmap ,gb <Plug>(go-build)
au FileType go nmap ,gt <Plug>(go-test)
au FileType go nmap ,gc <Plug>(go-coverage)
au FileType go nmap ,gds <Plug>(go-def-split)
au FileType go nmap ,gdv <Plug>(go-def-vertical)
au FileType go nmap ,gdt <Plug>(go-def-tab)
"" fzf
let g:fzf_action = { 'ctrl-t': 'tab split', 'ctrl-s': 'split', 'ctrl-v': 'vsplit' } " 他のTab動作と同じmapping
command! -bang -nargs=? -complete=dir HFiles
  \ call fzf#vim#files(<q-args>, {'source': 'ag --hidden --ignore .git -g ""'}, <bang>0) " hidden fileを含む
nnoremap <C-h> :HFiles<CR>
nnoremap <C-p> :GFiles<CR>
" ag
" Ctrl+sでカーソル上の文字を検索
nnoremap <C-s> :Ag "<C-R><C-W>"<CR>
" nerdtree
map <C-n> :NERDTreeToggle<CR>
