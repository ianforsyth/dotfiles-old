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
Plugin 'w0rp/ale'
Plugin 'dyng/ctrlsf.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Asks to save before switching files instead of throwing an error
set confirm

" Line numbers are relative to cursor position, except current
set number relativenumber

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

" Git gutter check time
set updatetime=250

" Settings for netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25

" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" CtrlSF opens in full screen
let g:ctrlsf_winsize = '100%'

" Function to toggle full screen pane
let g:toggle_window_expand = 0
function! ToggleWindowExpand()
  let g:toggle_window_expand = !g:toggle_window_expand
  return g:toggle_window_expand
endfunction

" Syntax highlighting and color scheme
syntax on
if (has("termguicolors"))
 set termguicolors
endif
colorscheme OceanicNext

" ALE syntax checker settings
let g:ale_linters = { 'javascript': ['eslint'] }
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

" Remove trailing whitespace before save
autocmd BufWritePre * %s/\s\+$//e

" Set leader to space bar
let mapleader=" "

" Mappings
inoremap jj <esc>:w<enter>
nmap <C-j> :m +1 <enter>
nmap <C-k> :m -2 <enter>
nmap <C-l> <C-W><C-W>
noremap <Leader>t :Files<enter>
nnoremap <Leader>s :Vexplore <enter>
nnoremap <Leader>f :CtrlSF
nnoremap <Leader>c :let @+=expand('%:p')<cr>
nnoremap <expr> <Leader><enter> ToggleWindowExpand() ? '<C-W><C-_>' : '<C-W><C-=>'

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
