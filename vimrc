call plug#begin()
Plug 'dylanaraps/wal.vim'
call plug#end()

colorscheme wal

syntax enable 

" incremental search ftw
set incsearch 

" Relative numbers for crazy jumps!!!
set number
set relativenumber

" Center cursor after half-page jump
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Buffer stuff, may be useful later
nnoremap <M-l> :bn<CR>
nnoremap <M-h> :bp<CR>
nnoremap <M-b> :<C-u>execute v:count1 . 'buffer'<CR>

" Man page on tmux pane!!!
nnoremap K :call TmuxMan()<CR>
function! TmuxMan() 
	let word = expand('<cword>')
	if exists('$TMUX')
		call system("tmux split-window -h 'man ". word . "'")
	else
		execute '!man' word
	endif
endfunction
