" look for modelines anywhere in the first five lines.
set modelines=5
set modeline

" disable word wrap.
set nowrap

" disable the swap file (because it swamps my dropbox history).
set noswapfile

" don't expand tabs into spaces.
set shiftwidth=4
set shiftround
set noexpandtab
set autoindent

" get rid of vi compatible keys.
set nocompatible

" allow switching between buffers without saving them.
set hidden

" always show the tab bar, even when not in use.
set showtabline=2

" enable the ruler (character position in the bottom right).
set ruler

" enable syntax highlighting.
syntax on

" make tab competion act more like bash, showing matches.
set wildmenu
set wildmode=list:longest