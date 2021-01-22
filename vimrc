set nocompatible
filetype off

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif


" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'                             " File navigation
  Plug 'pangloss/vim-javascript'                      " Javascript syntax
  Plug 'leafgarland/typescript-vim'                   " Typescript syntax
  Plug 'maxmellon/vim-jsx-pretty'                     " React JSX syntax
  Plug 'mhartington/oceanic-next'                     " Color theme
  Plug 'neoclide/coc.nvim' , { 'branch' : 'release' } " Autocompletion and linting
  Plug 'godlygeek/tabular'                            " Formatting columns (like these comments)
  Plug 'dyng/ctrlsf.vim'                              " Global search
  Plug 'itchyny/lightline.vim'                        " Styled tabs and footer
  Plug 'SirVer/ultisnips'                             " Custom snippets
call plug#end()

" UltiSnips configuration
let g:UltiSnipsSnippetsDir = '~/.vim/mysnippets'
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsJumpForwardTrigger='<tab>'

" Settings for lightline status line
set laststatus=2
set noshowmode
let g:lightline = {
\  'colorscheme': 'wombat',
\  'active': {
\   'left':[['mode', 'paste'],
\          ['relativepath']
\    ],
\    'right': [['lineinfo'], ['percent']]
\  },
\  'component': {
\    'lineinfo': '%3l:%-2v',
\  },
\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
\}

" --- CoC Configuration --- 
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-snippets'] " Install CoC extensions
let b:coc_root_patterns = ['.env']                           " Use closest .env to determine working directory

nmap <Leader>ac  <Plug>(coc-codeaction) 
nmap <leader>rn <Plug>(coc-rename) 
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)

" Show the error symbol over top of the line number to prevent shifting
if has("patch-8.1.1564")
  set signcolumn=number " Recently vim can merge signcolumn and number column into one
else
  set signcolumn=yes
endif
" --- End CoC Configuration --- 

" Set fzf to respect gitignore
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Have CtrlSF autofocus the search window
let g:ctrlsf_auto_focus = { 'at' : 'start' }
let g:ctrlsf_position = 'right'

" Syntax highlighting and color scheme
syntax on
set re=0 
if (has("termguicolors"))
  set termguicolors
endif
colorscheme OceanicNext

" Use indents for folding and default to open
" set foldlevelstart=20
" set foldmethod=indent

" Asks to save before switching files instead of throwing an error
set confirm

" Line numbers
set number
"
" Show lines beyond the top and bottom of cursor
set scrolloff=3

" Case insensitive matching unless one capital letter
set ignorecase
set smartcase

" More natural split opening
set splitbelow
set splitright

" Pattern match while typing, highlight results
set incsearch
set hlsearch

" Softtabs, 2 spaces
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

" Make it obvious where 100 characters is
set textwidth=100
set colorcolumn=+1

" Remove trailing whitespace before save except in this vimrc (for ex commands followed by a space)
autocmd BufWritePre * if index(['vim'], &ft) < 0 | %s/\s\+$//e

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Set leader to space bar
let mapleader=" "
" Mappings

inoremap jj <esc>:w<enter>
nmap <C-j> :m +1 <enter>
nmap <C-k> :m -2 <enter>
noremap <Leader>t :Files<enter>
nnoremap <Leader>s :Vexplore <enter>
nnoremap <Leader>f :CtrlSF
nnoremap <leader>F :CtrlSF <c-r>=expand("<cword>")<cr><enter>
nnoremap <leader>w :w!<CR>
nnoremap <leader>q :q!<CR>
nnoremap <Leader>c :let @+=expand('%:p')<cr>
nnoremap <Leader>x :tabo<CR>

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
