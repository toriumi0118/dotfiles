""" --- dein default configs --- 
if &compatible
  set nocompatible " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.cache/nvim/dein')

" Let dein manage dein
" Required:
call dein#add('~/.cache/nvim/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
call dein#add('junegunn/vim-easy-align')
call dein#add('mattn/emmet-vim')
call dein#add('hoob3rt/lualine.nvim')
call dein#add('kyazdani42/nvim-web-devicons')
call dein#add('junegunn/fzf', {'path': '~/.fzf', 'build': './install --all'})
call dein#add('junegunn/fzf.vim')
call dein#add('tomtom/tcomment_vim')
call dein#add('mlaursen/vim-react-snippets')
call dein#add('SirVer/ultisnips')
call dein#add('elixir-editors/vim-elixir')
call dein#add('slime-lang/vim-slime-syntax')
call dein#add('nvim-treesitter/nvim-treesitter', { 'merged': 0, 'build': ':TSUpdate' })
call dein#add('tpope/vim-fugitive')
call dein#add('hashivim/vim-terraform')
call dein#add('jparise/vim-graphql')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

""" --- directory configs ---
" スワップファイル用のディレクトリを指定する
silent !mkdir $HOME/.vim/swp > /dev/null 2>&1
silent !mkdir $HOME/.vim/undo > /dev/null 2>&1
set directory=$HOME/.vim/swp
set undodir=$HOME/.vim/undo
set undofile
set nobackup

""" --- control configs ---
set hidden       " 変更中のファイルでも、保存しないで他のファイルを表示する
set incsearch    " インクリメンタルサーチを行う
set ic           " ignore case
"set omnifunc=syntaxcomplete#Complete " omni completion (default function)
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis

""" --- indent configs ---
set expandtab    " タブの代わりに空白文字を指定する
set autoindent   " 新しい行のインデントを現在行と同じにする
set smartindent  " 改行時にブロックに応じて自動でインデント数を調整して入れる
set smarttab     " 行の先頭で<Tab>キーを入力するとインデントを挿入する
set synmaxcol=0  " シンタックスハイライトの行上限をなくす

augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.elm     setlocal tabstop=4 shiftwidth=4
  autocmd BufNewFile,BufRead *.py      setlocal tabstop=4 shiftwidth=4
  autocmd BufNewFile,BufRead *.rb      setlocal tabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.js      setlocal tabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.ts      setlocal tabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.jsx     setlocal tabstop=2 shiftwidth=2 filetype=javascript.jsx
  autocmd BufNewFile,BufRead *.tsx     setlocal tabstop=2 shiftwidth=2 filetype=typescript.tsx
  autocmd BufNewFile,BufRead *.go      setlocal tabstop=4 shiftwidth=4 noexpandtab completeopt=menu,preview
  autocmd BufNewFile,BufRead *.dart    setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd BufNewFile,BufRead *.scss    setlocal tabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead Appfile   setlocal tabstop=2 shiftwidth=2 filetype=rb syntax=ruby
  autocmd BufNewFile,BufRead Fastfile  setlocal tabstop=2 shiftwidth=2 filetype=rb syntax=ruby
  autocmd BufNewFile,BufRead Matchfile setlocal tabstop=2 shiftwidth=2 filetype=rb syntax=ruby
  autocmd BufNewFile,BufRead *.graphql setlocal tabstop=2 shiftwidth=2
augroup END

""" --- keymap configs ---
" 検索結果のハイライトをesc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" coc-explorer
nnoremap <silent><C-n> <Cmd>CocCommand explorer<CR>
nnoremap <silent>sg <Cmd>call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR>

" screen
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
nnoremap s= <C-w>=
nnoremap so <C-w>_<C-w>|
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap s> <C-w>>
nnoremap s< <C-w><
nnoremap s+ <C-w>+
nnoremap s- <C-w>-
" Tab
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

""" --- clipboard config ---
" cpで現在のファイルをclipboardへ
nmap cp :let @+ = expand("%")<CR>
set clipboard=unnamedplus          " system clipboardと連携

""" --- plugin config ---
" easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" emmet
let g:user_emmet_expandabbr_key = '<c-e>'

" lualine
lua require('lualine').setup()

" fzf
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction
command! -bang -nargs=? -complete=dir HFiles
  \ call fzf#vim#files(<q-args>, {'source': 'ag --hidden --ignore .git --ignore "*.mp4" -g ""'}, <bang>0) " hidden fileを含む
nnoremap <silent><C-h> :HFiles<CR>
nnoremap <silent><C-p> :GFiles<CR>
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" ag
nnoremap <silent><C-s> :Ag <C-R><C-W><CR>

" elixir
autocmd FileType elixir imap >> \|><Space>

" coc
"" \ 'coc-flutter',
"" \ 'coc-go',
let g:coc_global_extensions = [
            \ 'coc-css',
            \ 'coc-eslint',
            \ 'coc-eslint8',
            \ 'coc-prettier',
            \ 'coc-stylelintplus',
            \ 'coc-tsserver',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-elixir',
            \ 'coc-rust-analyzer',
            \ ]
"" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>
"" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
"" Remap for rename current word
nmap <silent> <space>rn <Plug>(coc-rename)
"" Using CocList
nnoremap <silent> <space>a :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c :<C-u>CocList commands<cr>
nnoremap <silent> <space>o :<C-u>CocList outline<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j :<C-u>CocNext<CR>
nnoremap <silent> <space>k :<C-u>CocPrev<CR>
nnoremap <silent> <space>p :<C-u>CocListResume<CR>
"" completion
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
""" C-spaceがmacだと食われるので
""" システム環境設定 > キーボード > ショートカット > 入力ソースの「前の入力ソースを選択」と「入力ソースの次のソースを選択」のチェックを外す
" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "aaa" :
"       \ coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()
""" CocReference（gr）を使うとtext cursorが見えなくなるworkaround
let g:coc_disable_transparent_cursor = 1

" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "haskell"  }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "vim" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    -- additional_vim_regex_highlighting = false,
  },
}
EOF

""" --- display config ---
set number                     " 行番号を表示する
set showmatch                  " 閉括弧が入力された時、対応する括弧を強調する
set showcmd                    " コマンドの表示
set smartcase                  " smartcase
set termguicolors              " true color
set showtabline=2              " 常にタブラインを表示
syntax enable                  " 色設定
colorscheme molokai
