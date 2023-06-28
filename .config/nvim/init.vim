""" --- dein default configs --- 
let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE . '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif
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
call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) 
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
call dein#add('antoinemadec/coc-fzf')
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
  autocmd BufNewFile,BufRead *.java    setlocal tabstop=4 shiftwidth=4
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
  autocmd BufNewFile,BufRead *.vim     setlocal tabstop=2 shiftwidth=2
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
lua require('lualine').setup({ sections = { lualine_c = { { 'filename', path = 1 } } } })

" fzf
nnoremap <silent> <space>f :Files<CR>
nnoremap <silent> <space>G :GFiles?<CR>
nnoremap <silent> <space>b :Buffers<CR>
nnoremap <silent> <space>h :History<CR>
nnoremap <silent> <space>l :Rg<CR>
nnoremap <silent> <space>s :Rg <C-R><C-W><CR>

"" markしたものをquickfix listに送る
function! s:build_quickfix_list(lines)
  if len(a:lines) == 1
    execute ':e ' . a:lines[0]
  else
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    copen
    cc
  endif
endfunction
let g:fzf_action = {
  \ 'ctrl-f': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
let $FZF_DEFAULT_COMMAND = 'rg --files' " .gitignoreを尊重する
let $FZF_PREVIEW_COMMAND="COLORTERM=truecolor bat --style=numbers --color=always --theme='Monokai Extended' {}" 

" coc-fzf
let g:coc_fzf_preview = "right:50%"

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
nmap <silent> <space>d <Plug>(coc-definition)
nmap <silent> <space>y <Plug>(coc-type-definition)
nmap <silent> <space>i <Plug>(coc-implementation)
nmap <silent> <space>r <Plug>(coc-references)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  endif
endfunction
nnoremap <silent> <space>D :<C-u>call <SID>show_documentation()<CR>
"" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
"" Remap for rename current word
nmap <silent> <space>n <Plug>(coc-rename)
nmap <silent> <space>a  <Plug>(coc-codeaction-selected)iw
"" Using CocList
nnoremap <silent> <space>cd :<C-u>CocFzfList diagnostics<cr>
nnoremap <silent> <space>ce :<C-u>CocFzfList extensions<cr>
nnoremap <silent> <space>cc :<C-u>CocFzfList commands<cr>
nnoremap <silent> <space>co :<C-u>CocFzfList outline<cr>
nnoremap <silent> <space>cs :<C-u>CocFzfList -I symbols<cr>
nnoremap <silent> <space>cj :<C-u>CocNext<CR>
nnoremap <silent> <space>ck :<C-u>CocPrev<CR>
nnoremap <silent> <space>cp :<C-u>CocFzfListResume<CR>
"" completion
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-n> coc#pum#visible() ? coc#pum#next(1) : coc#refresh()
inoremap <expr><c-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-e> coc#pum#visible() ? coc#pum#cancel() : "<plug>(emmet-expand-abbr)"
" rust-analyzerだとcheckOnSaveが激おそなのでcheckはコマンドで行う
nnoremap <silent> <c-k> :<C-u>CocCommand rust-analyzer.runFlycheck<cr>
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
      \   "\<Plug>(fern-action-open:edit)",
      \   "\<Plug>(fern-action-expand)",
      \   "\<Plug>(fern-action-collapse)",
      \ )

  nmap <buffer><nowait> l <Plug>(fern-action-expand)
  nmap <buffer><nowait> <Enter> <Plug>(fern-my-expand-or-collapse)

  nmap <buffer> q :<C-u>quit<CR>

  " disable default mapping
  silent! nunmap <buffer> s
  silent! nunmap <buffer> z
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

let g:fern#renderer = "nerdfont"
let g:fern#renderer#nerdfont#indent_markers = 1

" fugitiveo
nnoremap [fugitive]  <Nop>
nmap <space>g [fugitive]
nnoremap <silent> [fugitive]s :G<CR>
nnoremap <silent> [fugitive]a :Gwrite<CR>
nnoremap <silent> [fugitive]c :G commit -v<CR>
nnoremap <silent> [fugitive]b :G blame<CR>
nnoremap <silent> [fugitive]d :Gvdiffsplit!<CR>
nnoremap <silent> [fugitive]m :G mergetool<CR>
nnoremap <silent> [fugitive]p :G push -u<CR>

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

