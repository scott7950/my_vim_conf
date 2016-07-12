source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/gvimrc_example.vim

" run before loading scripts from .vim/bundle, 
" which will load systemverilog match script
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
Plugin 'scrooloose/nerdtree'
Plugin 'hari-rangarajan/CCTree'
Plugin 'giraldeau/ccglue'
"Plugin 'vim-scripts/cscope.vim'
Plugin 'amal-khailtash/vim-ralf-syntax'
""Plugin 'xmementoit/vim-ide'
Plugin 'fatih/vim-go'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'rust-lang/rust.vim'

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

set ai
set ts=2
set sw=2
set nu
set nobackup
set incsearch
set ic
set smartcase
set winminheight=0
set expandtab

colo desert
set guifont=Monospace

syntax on

aug filesyntax
    au BufNewFile,BufRead *.ini,*.tcl,*.ralf set filetype=tcl
    au BufNewFile,BufRead *.log,*.db set filetype=systemverilog
    au BufRead,BufNewFile *.v,*.vh,*.sv,*.svh,*.svi,*.sva set ft=systemverilog
    au BufRead,BufNewFile Makefile,makefile setf=makefile
    au BufRead,BufNewFile *.whd set ft=vhdl
    "au BufRead,BufNewFile *.sc,*.sch setf=systemc
aug END

"au BufReadPost *.log normal G
autocmd FileType make setlocal noexpandtab
let g:NERDTreeDirArrows=0

let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_smart_startup_focus=1

filetype plugin indent on

map <F2> :tabnew<CR>
map <F3> :NERDTreeMirrorOpen<CR>
map <C-left> :tabprevious<CR>
map <C-right> :tabnext<CR>

map <C-c> "*y
map <C-p> "*p
nnoremap gf <C-W>gf
vnoremap gf <C-W>gf

set guitablabel=\[%N\]\ %t\ %M
"set guifont=Courier\ 10

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

"set statusline=
"set statusline+=%<\                       " cut at start
"set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
"set statusline+=%-40f\                    " path
"set statusline+=%=%1*%y%*%*\              " file type
"set statusline+=%10((%l,%c)%)\            " line and column
"set statusline+=%P                        " percentage of file

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
