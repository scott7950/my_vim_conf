runtime plugin/vimballPlugin.vim
runtime macros/matchit.vim
runtime plugin/AlignPlugin.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'nachumk/systemverilog.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/gvimrc_example.vim

set ai
set ts=4
set sw=4
set nu
set nobackup
set incsearch
set ic
set smartcase
set winminheight=0
set expandtab

colo desert
set guifont=Monospace

"if
"hi Visual guifg=NONE
"el
"hi Normal guifg=White guibg=Black
"hi NonText guibg=Black
"hi Constant guifg=Lightred guibg=Black
"hi Special guifg=Orange guibg=Black
"hi search guibg=Darkcyan
"en

syntax on

aug filesyntax
    au BufNewFile,BufRead *.ini,*.tcl,*.ralf set filetype=tcl
    au BufNewFile,BufRead *.log,*.db set filetype=systemverilog
    au BufRead,BufNewFile *.v,*.vh,*.sv,*.svh,*.svi,*.sva set ft=systemverilog
    au BufRead,BufNewFile Makefile,makefile setf=makefile
    "au BufRead,BufNewFile *.sc,*.sch setf=systemc
aug END

"au BufReadPost *.log normal G
autocmd FileType make setlocal noexpandtab

filetype plugin indent on

map <F2> :tabnew<CR>
map <F3> :NERDTree<CR>
map <C-left> :tabprevious<CR>
map <C-right> :tabnext<CR>

map <C-c> "*y
map <C-p> "*p

set guitablabel=\[%N\]\ %t\ %M
"set guifont=Courier\ 10

set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
set statusline+=%-40f\                    " path
set statusline+=%=%1*%y%*%*\              " file type
set statusline+=%10((%l,%c)%)\            " line and column
set statusline+=%P                        " percentage of file

"set statusline=   " clear the statusline for when vimrc is reloaded
"set statusline+=%-3.3n\                      " buffer number
"set statusline+=%f\                          " file name
"set statusline+=%h%m%r%w                     " flags
"set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
"set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
"set statusline+=%{&fileformat}]              " file format
"set statusline+=%=                           " right align
"set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
"set statusline+=%b,0x%-8B\                   " current char
"set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

"set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P

"set statusline=%f%w%m%h%1*%r%2*%{VarExists('b:devpath','<Rel>')}%3*%{VarExists('b:relpath','<Dev>')}%{XLockStat()}%=%-15(%l,%c%V%)%P

"let &statusline='%<%f%{&mod?"[+]":""}%r%{&fenc !~ "^$\\|utf-8" || &bomb ? "[".&fenc.(&bomb?"-bom":"")."]" : ""}%=%15.(%l,%c%V %P%)'
"
"" Another way to write godlygeeks:
"set statusline=%<%f%m%r%{Fenc()}%=%15.(%l,%c%V\ %P%)
"function! Fenc()
"    if &fenc !~ "^$\|utf-8" || &bomb
"        return "[" . &fenc . (&bomb ? "-bom" : "" ) . "]"
"    else
"        return ""
"    endif
"endfunction
