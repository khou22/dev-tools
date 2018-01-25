" Author: Kevin Hou
" Created August 2, 2017
" Base from: Steve Aragon

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
command! W :w                                " Seriously, it's not like :W is bound
set nocompatible        " Use Vim defaults instead of 100% vi compatibility
set undolevels=1000                          " Large undo levels.
set undofile                                 " Save undo tree.
set undodir=/tmp                             " Undo tree directory.
set history=50                               " Size of command history.
set encoding=utf8                            " Always use unicode.
set backspace=indent,eol,start               " Fix backspace.
set nobackup                                 " Disable backups.
set nowritebackup
set noswapfile
set notimeout                                " Fix lag in iTerm.
set ttimeout
set timeoutlen=50
set nomodeline
set selection=inclusive                      " Select to the end of line.
set spelllang=en_us                          " Set spell check language.
set tags+=tags                               " Enable tags.
set number                                   " add line numbers
" add line numbers
call plug#begin("~/.vim/plugged")
Plug 'tomtom/tcomment_vim'
Plug 'leafgarland/typescript-vim'
" Plug 'tpope/vim-fugitive' " GIT integration by typing :Gstatus, etc.
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'henrik/rename.vim'
Plug 'junegunn/goyo.vim'
Plug 'skalnik/vim-vroom'
Plug 'dyng/auto_mkdir'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'mileszs/ack.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' } " Autocomplete
Plug 'yggdroot/indentline' " Showing intend alignments
Plug 'airblade/vim-gitgutter' " Git diff in the left gutter (next to line numbers)
Plug 'vim-airline/vim-airline' " Better footer status bar
Plug 'terryma/vim-multiple-cursors' " Sublime-like multiple highlighting
Plug 'easymotion/vim-easymotion' " Fast, lucid in-file navigation
Plug 'pangloss/vim-javascript' " Javascript highlighting
Plug 'mxw/vim-jsx' " JSX highlighting

call plug#end()
" ------------------------------------------------------------------------------
" Binds
" ------------------------------------------------------------------------------
let mapleader = ","
" ------------------------------------------------------------------------------
" Ctrl-p
" ------------------------------------------------------------------------------
let g:ctrlp_map = "<Leader>t"
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" let g:ctrlp_match_func = {"match" : "matcher#cmatch" }
set splitbelow
set splitright
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
" ------------------------------------------------------------------------------
 " Search and Replace
"
"  ------------------------------------------------------------------------------
set incsearch                     " Show partial matches as search is entered.
set hlsearch                      " Highlight search patterns.
set ignorecase                    " Enable case insensitive search.
set smartcase                     " Disable case insensitivity if mixed case.
set wrapscan                      " Wrap to top of buffer when searching.
set gdefault                      " Make search and replace global by default.
"  ------------------------------------------------------------------------------
" White Space
"
"  ------------------------------------------------------------------------------
filetype plugin indent on
" show existing tabe with 4 spaces width
set tabstop=4
" when inddenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set softtabstop=4                 " Set soft tabs equal to 4 spaces.
set listchars=tab:··,trail:·      " Show leading whitespace
"  ------------------------------------------------------------------------------
" Presentation
"
"  ------------------------------------------------------------------------------
set shortmess=aIoO                " Show short messages, no intro.
set ttyfast                       " Fast scrolling when on a decent connection.
" set nowrap                        " Wrap text.
set showcmd                       " Show last command.
set ruler                         " Show the cursor position.
set hidden                        " Allow hidden buffers.
set showmatch                     " Show matching parenthesis.
set matchpairs+=<:>               " Pairs to match.
set cf                            " Enable error jumping.
syntax on                         " Enable syntax highlighting.
filetype off                      " Detect file type.
filetype indent on                " Enable file indenting.
filetype plugin indent on         " Load syntax files for better indenting.
highlight ColorColumn ctermbg=236 guibg=#262D51
" ------------------------------------------------------------------------------
" User Interface
" ------------------------------------------------------------------------------
" color base16-default
if has("gui_running")
    set guioptions-=m             " Disable menu bar.
    set guioptions-=T             " Disable the tool bar bar.
    set guioptions-=l             " Disable left scrollbar.
    set guioptions-=L             " Disable left scrollbar when split.
    set guioptions-=r             " Disable right scrollbar.
    set guioptions-=a             " Do not auto copy selection to clipboard.
    " If MacVim do some specific things.
    set guifont=Monaco:h16
    set lines=52                      " Window size.
    set columns=165
    set vb                            " Disable the audible bell.
endif
if has("mouse")
    set mouse=a                   " Enable mouse everywhere.
    set mousemodel=popup_setpos   " Show a pop-up for right-click.
    set mousehide                 " Hide mouse while typing.
endif
" ------------------------------------------------------------------------------
" Status Line
" ------------------------------------------------------------------------------
" Always show status.
set laststatus=2
" Disable status line fill chars.
set fillchars+=stl:\ ,stlnc:\ " Space.
" ------------------------------------------------------------------------------
" Rainbow Parenthesis
" ------------------------------------------------------------------------------
au FileType coffee setlocal tabstop=4 softtabstop=4 shiftwidth=4
au FileType ruby setlocal tabstop=4 softtabstop=4 shiftwidth=4 colorcolumn=121 textwidth=120
au FileType html,haml,scss setlocal tabstop=4 softtabstop=4 shiftwidth=4
au FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab nolist
au FileType javascript,js setlocal tabstop=4 shiftwidth=4 softtabstop=4
au FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" keybindings for vdebug
" let g:vdebug_keymap = {
" \    "run" : "<Leader>/",
" \    "run_to_cursor" : "<Down>",
" \    "step_over" : "<Up>",
" \    "step_into" : "<Left>",
" \    "step_out" : "<Right>",
" \    "close" : "q",
" \    "detach" : "x",
" \    "set_breakpoint" : "<Leader>p",
" \    "eval_visual" : "<Leader>e"
" \}
" let g:vdebug_options = {
" \    "break_on_open" : 0,
" \}

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup
execute pathogen#infect()
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
syntax enable
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme desert
highlight Normal ctermbg=Black
let g:netrw_liststyle=3
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
let g:ackprg = 'ag --nogroup --nocolor --column'
filetype plugin indent on
syntax on


" Addiontal Customization

" Solarized color scheme
syntax enable
set background=dark
colorscheme solarized

" Set cursor line color
set cursorline
hi CursorLine ctermbg=238 " Works for both dark and light backgrounds

" Git Gutter (Git Diff in Sidebar)
set updatetime=250

" Toggling whether line is highlighted
:autocmd InsertEnter,InsertLeave * set cul!

" NERDTree folder tree
autocmd vimenter * NERDTree " Automatically open when VIM opens
let NERDTreeShowHidden = 1 " Show hidden files by default

" Sublime-like multiple cursor highlighting and editing
let g:multi_cursor_next_key='<C-d>' " Default: <C-n>

" MARK: Easy Motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" MARK: End of Easy Motion

" vim-jsx: JSX highlighting
let g:jsx_ext_required = 0 " Allows JSX highlighting in .js files

" Line wrap when moving left and right with cursor
set whichwrap+=<,>,h,l,[,]

