" look for modelines anywhere in the first five lines.
set modelines=5
set modeline

" disable word wrap.
set nowrap

" show incomplete commands as they're typed.
set showcmd

" disable the swap file (because it swamps my dropbox history).
set noswapfile

" expand tabs into 2 spaces.
set tabstop=2
set shiftwidth=2
set expandtab

" round indent/outdent to the nearest tabstop.
set shiftround

" preserve current indent on new lines.
" (not 'smart' indent, which rarely works.)
set autoindent

" get rid of vi compatible keys.
set nocompatible

" highlight all search matches
" (use :noh to clear)
set hlsearch

" search case-insensitively,
" unless the search is MixedCase.
set ignorecase
set smartcase

" allow switching between buffers without saving them.
set hidden

" always show the tab bar, even when not in use.
set showtabline=2

" enable the ruler (character position in the bottom right).
set ruler

" show the ruler at column 80.
set colorcolumn=80
highlight ColorColumn ctermbg=233

" enable syntax highlighting.
syntax on

" make tab competion act more like bash, showing matches.
set wildmenu
set wildmode=list:longest

" wrap commit messages at 72 characters
au FileType gitcommit set tw=72
