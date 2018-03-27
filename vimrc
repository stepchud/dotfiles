" mostlyrecommended from http://items.sjbach.com/319/configuring-vim-right
" no vi compatibility

" ~/.vim/autoload/pathogen.vim
execute pathogen#infect()

set nocompatible

" prevent some modelines sec exploits
set modelines=0

" manage buffers correctly
set hidden

" remap ` to '
nnoremap ' `
nnoremap ` '

" set very magic searching (more natural)
nnoremap / /\v
vnoremap / /\v

" map leader to <SPACE>
let mapleader = " "

" more history
set history=1000

" extended % matching
runtime macros/matchit.vim

" useful file/cmd completion
set wildmenu
set wildmode=list:longest

" case-smart searching
set ignorecase
set smartcase

" auto-sub all matches on the line ("g")
set gdefault

" terminal title
set title

" context around cursor
set scrolloff=3

" temp files in one dir
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" get rid of that Gd F1 key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" map ; to :
nnoremap ; :

" faster viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" limited line-numbers
set ruler

" line nos
set number

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" tabs are 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set autoindent
set expandtab

" show mode in Insert/Replace/Visual
set showmode

" always show status line
set laststatus=2

" keep an undofile across sessions
set undofile

" File-type highlighting and configuration.
syntax enable
if has("autocmd")
  filetype on
  filetype plugin on
  filetype indent on
  " Restore cursor pos
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
  " auto-save on focus lost
  autocmd FocusLost * :wa
endif

  " vim starts too slow in jruby
if !empty(matchstr($MY_RUBY_HOME, 'jruby'))
  let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/rubysite_ruby/*'),"\n"),',')
endif

" use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
  cnoreabbrev ag Ack
  cnoreabbrev ack Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
endif

" highlight search terms, matching brackets
set hlsearch
set incsearch
set showmatch
" turnoff highlighting
nnoremap <leader><space> :nohl<cr>

" tab jumps to matching bracket
nnoremap <tab> %
vnoremap <tab> %

" chg shortmess (help :shortmess for details)
set shortmess=atI

" silent bell
set errorbells
set visualbell

" faster redrawing
set ttyfast

" customize some colors
hi Comment term=bold ctermfg=yellow ctermbg=blue
hi Pmenu ctermbg=13 guibg=Magenta

" Command-T mappings
let g:CommandTMaxHeight = 30
let g:CommandTMaxFiles = 20000

map <leader>f :CommandT<CR>
map <leader>b :CommandTBuffer<CR>
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <C-N> :cnext<CR>
map <C-P> :cprev<CR>

function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-N>"
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

