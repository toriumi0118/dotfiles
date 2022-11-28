""" --- dein default configs --- 
set nocompatible " Be iMproved

" Required:
set runtimepath+=~/.cache/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.cache/nvim/dein')

" Let dein manage dein
" Required:
call dein#add('~/.cache/nvim/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })
call dein#add('junegunn/vim-easy-align')
call dein#add('lambdalisue/fern.vim')
call dein#add('lambdalisue/nerdfont.vim')
call dein#add('lambdalisue/fern-renderer-nerdfont.vim')
call dein#add('lambdalisue/fern-git-status.vim')
call dein#add('mattn/emmet-vim')
call dein#add('hoob3rt/lualine.nvim')
call dein#add('nvim-tree/nvim-web-devicons')
call dein#add('tomtom/tcomment_vim')
call dein#add('mlaursen/vim-react-snippets', { 'depends': 'ultisnips' })
call dein#add('SirVer/ultisnips')
call dein#add('nvim-treesitter/nvim-treesitter', { 'merged': 0, 'build': ':TSUpdate' })
call dein#add('hashivim/vim-terraform')
call dein#add('jparise/vim-graphql')
call dein#add('tpope/vim-fugitive')
call dein#add('sainnhe/sonokai')
call dein#add('nvim-lua/plenary.nvim')
call dein#add('nvim-telescope/telescope.nvim', { 'rev': '0.1.0' })
call dein#add('fannheyward/telescope-coc.nvim')

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
set nowritebackup

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
""" --- display config ---
set number                     " 行番号を表示する
set showmatch                  " 閉括弧が入力された時、対応する括弧を強調する
set showcmd                    " コマンドの表示
set smartcase                  " smartcase
set termguicolors              " true color
set showtabline=2              " 常にタブラインを表示
syntax enable                  " 色設定
colorscheme sonokai


""" --- keymap configs ---
" 検索結果のハイライトをesc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

""" --- clipboard config ---
" cpで現在のファイルをclipboardへ
nmap cp :let @+ = expand("%")<CR>
set clipboard=unnamedplus          " system clipboardと連携

""" --- plugin config ---
" easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" lualine
lua require('lualine').setup()

" fzf

" coc
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-eslint',
  \ 'coc-eslint8',
  \ 'coc-prettier',
  \ 'coc-stylelintplus',
  \ 'coc-tsserver',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-flutter',
  \ 'coc-rust-analyzer',
  \ ]
"" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr :<C-u>Telescope coc references<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  endif
endfunction
nnoremap <silent> K :<C-u>call <SID>show_documentation()<CR>
"" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
"" Remap for rename current word
nmap <silent> <space>rn <Plug>(coc-rename)
nmap <silent> <space>a  <Plug>(coc-codeaction-selected)iw
"" Using CocList
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c :<C-u>CocList commands<cr>
nnoremap <silent> <space>o :<C-u>CocList outline<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j :<C-u>CocNext<CR>
nnoremap <silent> <space>k :<C-u>CocPrev<CR>
nnoremap <silent> <space>p :<C-u>CocListResume<CR>
"" completion
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-n> coc#pum#visible() ? coc#pum#next(1) : coc#refresh()
inoremap <expr><c-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-e> coc#pum#visible() ? coc#pum#cancel() : "<plug>(emmet-expand-abbr)"
""" CocReference（gr）を使うとtext cursorが見えなくなるworkaround
let g:coc_disable_transparent_cursor = 1

" emmet
let g:user_emmet_expandabbr_key = '<c-e>'

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

" fern
nnoremap <C-n> :<C-u>Fern . -reveal=% -drawer -toggle -width=40<CR>
nnoremap <silent> sg :<C-u>Fern . -drawer -reveal=% -width=40 -wait<CR><C-w>=

function! s:init_fern() abort
  " Define NERDTree like mappings
  nmap <buffer> o <Plug>(fern-action-open:edit)
  nmap <buffer> go <Plug>(fern-action-open:edit)<C-w>p
  nmap <buffer> t <Plug>(fern-action-open:tabedit)
  nmap <buffer> T <Plug>(fern-action-open:tabedit)gT
  nmap <buffer> i <Plug>(fern-action-open:split)
  nmap <buffer> gi <Plug>(fern-action-open:split)<C-w>p
  nmap <buffer> e <Plug>(fern-action-open:vsplit)
  nmap <buffer> ge <Plug>(fern-action-open:vsplit)<C-w>p
  nmap <buffer> ma <Plug>(fern-action-new-path)
  nmap <buffer> r <Plug>(fern-action-rename:bottom)

  nmap <buffer> C <Plug>(fern-action-enter)<Plug>(fern-wait)<Plug>(fern-action-tcd:root)
  nmap <buffer> U <Plug>(fern-action-leave)<Plug>(fern-wait)<Plug>(fern-action-tcd:root)
  nmap <buffer> R gg<Plug>(fern-action-reload)<C-o>
  nmap <buffer> cd <Plug>(fern-action-cd)
  nmap <buffer> CD gg<Plug>(fern-action-cd)<C-o>

  nmap <buffer> I <Plug>(fern-action-hidden:toggle)

  nmap <buffer><expr>
      \ <Plug>(fern-my-expand-or-collapse)
      \ fern#smart#leaf(
      \   "\<Plug>(fern-action-collapse)",
      \   "\<Plug>(fern-action-expand)",
      \   "\<Plug>(fern-action-collapse)",
      \ )

  nmap <buffer><nowait> l <Plug>(fern-my-expand-or-collapse)
  nmap <buffer><nowait> <Enter> <Plug>(fern-my-expand-or-collapse)

  nmap <buffer> q :<C-u>quit<CR>

  " disable default mapping
  silent! nunmap <buffer> s
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

let g:fern#renderer = "nerdfont"
let g:fern#renderer#nerdfont#indent_markers = 1

" telescope
lua require('telescope').load_extension('coc')

nnoremap <silent> <space>ff <cmd>Telescope find_files<cr>
nnoremap <silent> <space>fg <cmd>Telescope live_grep<cr>
nnoremap <silent> <space>fb <cmd>Telescope buffers<cr>
nnoremap <silent> <space>fh <cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>
nnoremap <silent> <space>fs <cmd>Telescope grep_string<cr>
nnoremap <silent> <space>fr <cmd>Telescope resume<cr>
nnoremap <silent> <space>ft <cmd>Telescope help_tags<cr>

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

