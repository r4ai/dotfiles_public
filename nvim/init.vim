" ---EDITOR SETTINGS---
set number

" Indent/Tab
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

set splitright
set fileencoding=utf-8

" Clipboard
set clipboard&
set clipboard^=unnamedplus

" Highlight
set cursorline

" Search
set hlsearch
set incsearch


" ---START SETTINGS---
call jetpack#begin()
" LIGHT
Jetpack 'jiangmiao/auto-pairs'
Jetpack 'jbgutierrez/vim-better-comments'
Jetpack 'miyakogi/seiya.vim'

" HEAVY

" THEME
Jetpack 'cocopon/iceberg.vim'
Jetpack 'Mofiqul/dracula.nvim'
call jetpack#end()


" ---COLOR SCHEME---
let g:seiya_auto_enable=1
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none
colorscheme hybrid
