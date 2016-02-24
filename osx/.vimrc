" configure color theme
"set background=dark
colorscheme moonshine

" Make Vim more useful
set nocompatible
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Enable syntax highlighting
syntax on
" Enable line numbers
set number 
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Highlight searches
set hlsearch
" Always show status line
set laststatus=2
" Show the cursor position
set ruler
" Show the filename in the window titlebar
set title
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif
