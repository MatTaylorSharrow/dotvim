" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'LargeFile'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
" Plugin 'Xdebug'

" Colour schemes and scroller combo 1
Plugin 'Colour-Sampler-Pack'
Plugin 'ScrollColors'
" OR combo 2
"Plugin 'flazz/vim-colorschemes'
"Plugin 'felixhummel/setcolors.vim'

Plugin 'gitdiff.vim'
Plugin 'jamessan/vim-gnupg'
Plugin 'yokomizor/LocateOpen'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'shemerey/vim-project'
Plugin 'ervandew/supertab'
Plugin 'taglist.vim'
Plugin 'ZoomWin'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'jmcantrell/vim-diffchanges'
Plugin 'tpope/vim-fugitive'


" Vim-Workspace - session management - maybe
"Plugin 'thaerkh/vim-workspace'
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

