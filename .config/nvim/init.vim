" workaround for ultisnips
" https://github.com/SirVer/ultisnips/issues/996
if has('python3')
  silent! python3 1
endif
" workaround: paste時に何か ^[[~201 とか入るやつのfix
" https://vimhelp.org/term.txt.html#xterm-bracketed-paste
" https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard/issues/31
" https://github.com/johndgiese/dotvim/issues/4
set t_BE=
" directory settings
" スワップファイル用のディレクトリを指定する
silent !mkdir $HOME/.vim/swp > /dev/null 2>&1
silent !mkdir $HOME/.vim/undo > /dev/null 2>&1
set directory=$HOME/.vim/swp
set undofile " undoを使う
set undodir=$HOME/.vim/undo
set nobackup
set nowritebackup

" controll settings
set nocompatible " vi互換をオフする
set hidden       " 変更中のファイルでも、保存しないで他のファイルを表示する
set incsearch    " インクリメンタルサーチを行う
set ic           " ignore case
filetype plugin on                   " omni completion (default function)
set omnifunc=syntaxcomplete#Complete " omni completion (default function)
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis

" indent settings
set tabstop=4    " 画面上で表示するtabの幅
set shiftwidth=4 " 自動インデントでのインデントの長さ
set expandtab    " タブの代わりに空白文字を指定する
set autoindent   " 新しい行のインデントを現在行と同じにする
set smarttab     " 新しい行を作ったときに高度な自動インデントを行う
set smartindent  " 前の行末をみて改行時のインデントを判断する

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.elm setlocal tabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.py  setlocal tabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb  setlocal tabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.js  setlocal tabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.ts  setlocal tabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.jsx setlocal tabstop=2 shiftwidth=2 filetype=javascript.jsx
    autocmd BufNewFile,BufRead *.tsx setlocal tabstop=2 shiftwidth=2 filetype=typescript.tsx
    autocmd BufNewFile,BufRead *.vue setlocal tabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.go  setlocal tabstop=4 shiftwidth=4 noexpandtab completeopt=menu,preview
augroup END

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
  execute 'nnoremap <silent> [Tab]m'.n ':<C-u>tabmove'.n.'<CR>'
endfor
map <silent> [Tab]t :tablast <bar> :tabnew<CR>
map <silent> [Tab]x :tabclose<CR>
map <silent> [Tab]n :tabnext<CR>
map <silent> [Tab]p :tabprevious<CR>
"" clipboard
""" cpで現在のファイルをclipboardへ
nmap cp :let @+ = expand("%")<CR>

" plugin installation
call plug#begin('~/.vim/plugged')
  "" XXX: Make sure to use single quotes
  Plug 'neoclide/coc.nvim', { 'branch': 'release'}
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'scrooloose/nerdtree'
  Plug 'junegunn/vim-easy-align'
  Plug 'tpope/vim-surround'
  Plug 'mattn/emmet-vim'
  Plug 'junegunn/fzf',                           { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'groenewege/vim-less'
  Plug 'fatih/vim-go',                           { 'do': ':GoUpdateBinaries' }
  Plug 'vim-jp/vim-go-extra',                    { 'for': 'go' }
  " Plug 'kana/vim-filetype-haskell',              { 'for': 'haskell' }
  " Plug 'itchyny/vim-haskell-indent',             { 'for': 'haskell' }
  Plug 'othree/yajs.vim',                        { 'for': 'javascript' }
  Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
  Plug 'othree/es.next.syntax.vim',              { 'for': 'javascript' }
  Plug 'maxmellon/vim-jsx-pretty',               { 'for': 'javascript' }
  Plug 'leafgarland/typescript-vim',             { 'for': 'typescript' }
  Plug 'posva/vim-vue',                          { 'for': 'vue' }
  Plug 'elixir-editors/vim-elixir',              { 'for': 'elixir' }
  Plug 'mattreduce/vim-mix',                     { 'for': 'elixir' }
  Plug 'elmcast/elm-vim',                        { 'for': 'elm' }
  Plug 'slim-template/vim-slim',                 { 'for': 'slim' }
  Plug 'delphinus/vim-firestore',                { 'for': 'firestore' }
  Plug 'dart-lang/dart-vim-plugin',              { 'for': 'dart' }
  Plug 'w0rp/ale'               " auto linter
  Plug 'tomtom/tcomment_vim'    " commenter
  Plug 'SirVer/ultisnips'
  Plug 'mlaursen/vim-react-snippets'
call plug#end()

" display settings
"" ステータスラインに文字コードと改行文字を表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set ambiwidth=double           " バルチバイトでずれるのを修正
set clipboard=unnamed          " クリップボードのレジスタ指定を不要にする
set number                     " 行番号を表示する
set showmatch                  " 閉括弧が入力された時、対応する括弧を強調する
set showcmd                    " コマンドの表示
set cmdheight=1                " コマンドラインの高さを調整
set smartcase                  " smartcase
set backspace=indent,eol,start " backspaceを有効にする
set hlsearch                   " 検索結果をハイライト表示する
set showtabline=2              " 常にタブラインを表示
set noshowmode                 " mode表示はlight lineに任せた
set termguicolors              " true color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
syntax enable                  " 色設定
colorscheme molokai

" plugin settings
"" easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
"" emmet
let g:user_emmet_expandabbr_key = '<c-e>'
"" lightline
let g:lightline = {
      \  'colorscheme': 'molokai',
      \  'active': {
      \    'left': [
      \      ['mode', 'paste'],
      \      ['gitbranch', 'filename']
      \    ],
      \    'right': [
      \      ['coc']
      \    ],
      \  },
      \  'component_function': {
      \    'gitbranch': 'fugitive#head',
      \    'coc': 'coc#status'
      \  }
      \}
"" vim-go
let g:go_fmt_autosave = 1
au FileType go nmap ,gr <Plug>(go-run)
au FileType go nmap ,gb <Plug>(go-build)
au FileType go nmap ,gt <Plug>(go-test)
au FileType go nmap ,gc <Plug>(go-coverage)
au FileType go nmap ,gds <Plug>(go-def-split)
au FileType go nmap ,gdv <Plug>(go-def-vertical)
au FileType go nmap ,gdt <Plug>(go-def-tab)
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1  
let g:go_highlight_operators = 1  
let g:go_highlight_build_constraints = 1  
"" fzf
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction
command! -bang -nargs=? -complete=dir HFiles
  \ call fzf#vim#files(<q-args>, {'source': 'ag --hidden --ignore .git -g ""'}, <bang>0) " hidden fileを含む
nnoremap <C-h> :HFiles<CR>
nnoremap <C-p> :GFiles<CR>
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
"" ag
nnoremap <C-s> :Ag <C-R><C-W><CR>
"" nerdtree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeMapOpenSplit = 'ss'
let g:NERDTreeMapOpenVSplit = 'sv'
nmap sg :NERDTreeFind<CR>
"" ale
let g:ale_fixers = {
      \ 'javascript': ['prettier', 'eslint'],
      \ 'typescript': ['prettier', 'eslint'],
      \ 'vue': ['prettier', 'eslint', 'stylelint'],
      \ 'ruby': ['rubocop'],
      \ 'elixir': ['mix_format'],
      \ 'elm': ['elm-format'],
      \ 'css': ['stylelint'],
      \ 'scss': ['stylelint'],
      \ }
let g:ale_lint_on_text_changed = 'never'     " setting for linter only run file changed
let g:ale_fix_on_save = 1                    " setting for linter only run file changed
let g:ale_ruby_rubocop_executable = 'bundle' " fix rubucop executor
"" elixir
autocmd FileType elixir imap >> \|><Space>
"" vue
autocmd FileType vue syntax sync fromstart
"" coc
""" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
""" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
""" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
""" Remap for rename current word
nmap <silent> <space>rn <Plug>(coc-rename)
""" Using CocList
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
