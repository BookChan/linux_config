set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936,gb2312
set ts=4

set history=500
set hidden


" set basic text window size
set  columns=150
set colorcolumn=100






" Enable filetype plugins
filetype plugin on
filetype indent on



set autoread  " set to suto read when a file is changed from the outside
set number
syntax enable       " Enable syntax highlighting





set ruler           "Always show current position
set ignorecase      " Ignore case when searching
set smartcase       " Be smart about cases when searching
set hlsearch        " Highligh search results
set showmatch       " Show matching brackets
set expandtab       " Use spaces instead of tabs
set smarttab        " Smart tab usage
set shiftwidth=4    " 1 tab equals 4 spaces
set statusline=\ %F%m%r%h\ %w\ %r%{getcwd()}%h\ \ \ Line:\ %l,%P  " Format the status line
set tabstop=4 



set cursorline      " Horizontal cursor line
set cursorcolumn    " Vertical cursor line
hi CursorLine cterm=NONE,underline guibg=#F4F4F4

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7


set paste   " for not auto comment

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile





" start pathogen plugin
execute pathogen#infect()

set background=dark " Background color
"colorscheme solarized " set color scheme
let g:solarized_termcolors=256




" search files 
set wildignore+=*.pyc,*.cache


" for nerdtree
"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <F2> :NERDTreeToggle<CR>

let NERDTreeIgnore = ['\.pyc$']

function NerdCD()
    if bufname("") !~ "^ftp://"
        lcd %:p:h
    endif
endfunction
autocmd BufEnter * call NerdCD()




""""""""""""""""""""""
    "Quickly Run
    """"""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc




" shorcut
set pastetoggle=<F3>




" set for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
