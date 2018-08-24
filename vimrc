set nocompatible
filetype off

" Set the runtime path to invlude Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin list
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'mhartington/oceanic-next'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'w0rp/ale'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'dyng/ctrlsf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Asks to save before switching files instead of throwing an error
set confirm

" Show partial command in the last line of the screen
set showcmd

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

" Git gutter check time
set updatetime=250

" Settings for netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" Syntax highlighting and color scheme
syntax on
if (has("termguicolors"))
 set termguicolors
endif
colorscheme OceanicNext

" ALE syntax checker settings for VTS
let g:ale_linters = { 'javascript': ['eslint'], 'ruby': ['rubocop'] }
let g:ale_fixers = { 'javascript': ['eslint'], 'ruby': ['rubocop'] }
let g:ale_fix_on_save = 1
let g:ale_set_highlights = 1
let g:ale_sign_error = '»'

" Settings for lightline status line
set laststatus=2
set noshowmode
let g:lightline = {
\  'colorscheme': 'wombat',
\  'active': {
\   'left':[['mode', 'paste'],
\          ['filename']
\    ],
\    'right': [['lineinfo'], ['percent']]
\  },
\  'component': {
\    'lineinfo': '%3l:%-2v',
\  },
\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
\}

" Remove trailing whitespace before save except in this vimrc (for ex commands followed by a space)
autocmd BufWritePre * if index(['vim'], &ft) < 0 | %s/\s\+$//e

" Set fzf to respect gitignore
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Have CtrlSF autofocus the search window
let g:ctrlsf_auto_focus = { 'at' : 'start' }
let g:ctrlsf_position = 'bottom'

" Set leader to space bar
let mapleader=" "

" Mappings
" inoremap jj <esc>:w<enter>
nmap <C-j> :m +1 <enter>
nmap <C-k> :m -2 <enter>
noremap <Leader>t :Files<enter>
nnoremap <Leader>s :Vexplore <enter>
nnoremap <Leader>f :CtrlSF 
nnoremap <Leader>c :let @+=expand('%:p')<cr>

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
