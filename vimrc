" mostlyrecommended from http://items.sjbach.com/319/configuring-vim-right
" no vi compatibility
set nocompatible

" manage buffers correctly
set hidden

" remap ` to '
nnoremap ' `
nnoremap ` '

" map leader to <SPACE>
let mapleader = " "

" more history
set history=1000

" extended % matching
runtime macros/matchit.vim

" useful file/cmd completion
set wildmenu
set wildmode=list,longest

" case-smart searching
set ignorecase
set smartcase

" terminal title
set title

" context around cursor
set scrolloff=3

" temp files in one dir
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" faster viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" limited line-numbers
set ruler

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" tabs are 2 spaces
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab

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
endif

" highlight search terms
set hlsearch
set incsearch

" chg shortmess (help :shortmess for details)
set shortmess=atI

" silent bell
set errorbells
set visualbell

" customize some colors
hi Comment term=bold ctermfg=yellow ctermbg=blue

" fuzzyfinder mappings
let g:fuf_enumeratingLimit = 70

map <leader>f :FufFile<CR>
map <leader>b :FufBuffer<CR>
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-N>"
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>
