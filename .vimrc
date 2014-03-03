" get rid of vi compatible keys.
set nocompatible

" start pathogen, if it's available on this machine.
" (see: https://github.com/tpope/vim-pathogen)
let s:pathogen_path = expand($HOME . "/.vim/autoload/pathogen.vim")
if filereadable(s:pathogen_path)
  execute pathogen#infect()
  execute pathogen#helptags()
end

" enable file type detection.
filetype plugin on

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

" make backspace work like most other apps.
" (this is the same as backspace=2)
set backspace=indent,eol,start

" show the ruler at column 81.
" (only works with vim >= 7.3)
if exists('+colorcolumn')
  set colorcolumn=81
  highlight ColorColumn ctermbg=233
end

" enable syntax highlighting.
syntax on

" make tab competion act more like bash, showing matches.
set wildmenu
set wildmode=list:longest

" wrap commit messages at 72 characters
au FileType gitcommit set tw=72

" highlight .md files as markdown
au BufRead,BufNewFile *.md set filetype=markdown
