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
  Plug 'airblade/vim-gitgutter'                       " Show git indicators
  Plug 'djoshea/vim-autoread'                         " Reload files changed outside vim
  Plug 'dyng/ctrlsf.vim'                              " Global search
  Plug 'fatih/vim-go'                                 " Developing in Go
  Plug 'itchyny/lightline.vim'                        " Status line and tab styling
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy file search
  Plug 'junegunn/fzf.vim'                             " Vim specific fzf port
  Plug 'leafgarland/typescript-vim'                   " Typescript syntax
  Plug 'maxmellon/vim-jsx-pretty'                     " React JSX syntax
  Plug 'morhetz/gruvbox'                              " Color scheme
  Plug 'neoclide/coc.nvim', {'branch': 'release'}     " Autocomplete and linting
  Plug 'preservim/nerdtree'                           " File system explorer
  Plug 'pangloss/vim-javascript'                      " Javascript syntax
  Plug 'peitalin/vim-jsx-typescript'                  " Typescript syntax highlighting
  Plug 'shinchu/lightline-gruvbox.vim'                " Gruvbox lightline theme
  Plug 'shumphrey/fugitive-gitlab.vim'                " Open GitLab remote
  Plug 'SirVer/ultisnips'                             " Custom snippets
  Plug 'tpope/vim-rails'                              " Rails helpers
  Plug 'tpope/vim-rhubarb'                            " Open GitLab remote
  Plug 'tpope/vim-fugitive'                           " Git functionality
call plug#end()

" Set leader to space bar
let mapleader=" "

" --- Lightline config ---
set laststatus=2
set noshowmode
let g:lightline = {
\  'colorscheme': 'gruvbox',
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

" --- UltiSnips configuration --- 
let g:UltiSnipsSnippetsDir = '~/.vim/mysnippets'
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsJumpForwardTrigger='<tab>'

" --- Fugitive GitLab config ---
let g:fugitive_gitlab_domains = ['https://gitlab.dev/']
nmap gb :GBrowse<cr>

" --- GitGutter config ---
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
function! GitGutterNextHunkCycle()
  let line = line('.')
  silent! GitGutterNextHunk
  if line('.') == line
    1
    GitGutterNextHunk
  endif
endfunction

" --- Vim Go config ---
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_def_mapping_enabled = 0 " disable vim-go :GoDef, handled by coc

" --- FZF config ---
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" --- CtrlSF config ---
let g:ctrlsf_auto_focus = { 'at' : 'start' }
let g:ctrlsf_auto_preview = 1

" --- CoC config ---
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-snippets', 'coc-solargraph'] " Install CoC extensions

" --- NERDTree config ---
let NERDTreeShowHidden=1

" --- Color Scheme config ---
if (has("termguicolors"))
  set termguicolors
endif
let g:gruvbox_invert_selection=0
colorscheme gruvbox
syntax on

" Line numbers
set number

" Softtabs, 2 spaces
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

" Make it obvious where 100 characters is
set textwidth=125 
set colorcolumn=+1

" Show the error symbol over top of the line number to prevent shifting
set signcolumn=number 

" Case insensitive matching unless one capital letter
set ignorecase
set smartcase

" Give more space for displaying messages.
set cmdheight=2

" Show lines beyond the top and bottom of cursor
set scrolloff=3

" Highlight active line
set cursorline

" Pattern match while typing, highlight results
set incsearch
set hlsearch

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

nmap ga <Plug>(coc-codeaction)
nmap gn <Plug>(coc-rename)
nmap gd <Plug>(coc-definition)
nmap gf <Plug>(coc-fix-current)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)
nmap ge <Plug>(coc-diagnostic-next)
nmap gc :call GitGutterNextHunkCycle()<cr>
nnoremap <C-J> :m +1<CR>
nnoremap <C-K> :m -2<CR>
inoremap <expr> <tab> pumvisible() ? coc#_select_confirm() : "<tab>"
inoremap jj <esc>:w<CR>
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <leader>t :Files<CR>
nmap <leader>f <Plug>CtrlSFPrompt ""<left>
nmap <leader>F <Plug>CtrlSFCwordPath<cr>
vmap <leader>F <Plug>CtrlSFVwordExec
