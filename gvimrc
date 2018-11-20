set nocompatible              " be iMproved, required
filetype off                  " required
let g:vundle_default_git_proto = 'git'

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'LargeFile'
Plugin 'airblade/vim-gitgutter'
"" Plugin 'Xdebug'
" Colour schemes and scroller combo 1
Plugin 'Colour-Sampler-Pack'
Plugin 'ScrollColors'
" OR combo 2
"Plugin 'flazz/vim-colorschemes'
"Plugin 'felixhummel/setcolors.vim'
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
Plugin 'c.vim'
Plugin 'grep.vim'
Plugin 'a.vim'
Plugin 'lifepillar/pgsql.vim'
" Vim-Workspace - session management - maybe
"Plugin 'thaerkh/vim-workspace'
call vundle#config#require(g:vundle#bundles)  "Temporary hack/fix for bug #430 https://github.com/VundleVim/Vundle.vim/wiki
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" session management
let g:session_directory = "~/.local/share/vim/sessions"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

set cmdheight=2
colorscheme industry
set nu
set belloff=all
set tabpagemax=25

" C language (vim's own builtin)
let c_comment_strings=1   " highlight strings inside C comments

"*****************************************************************************
"" Custom configs
"*****************************************************************************

" c
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab
"*****************************************************************************
"===============================================================================
" BUFFERS, WINDOWS
"===============================================================================
"-------------------------------------------------------------------------------
" The current directory is the directory of the file in the current window.
"-------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufEnter * :lchdir %:p:h
endif
"
"-------------------------------------------------------------------------------
" close window (conflicts with the KDE setting for calling the process manager)
"-------------------------------------------------------------------------------
noremap  <C-Esc>       :close<CR>
inoremap <C-Esc>  <C-C>:close<CR>
"-------------------------------------------------------------------------------
" Fast switching between buffers
" The current buffer will be saved before switching to the next one.
" Choose :bprevious or :bnext
"-------------------------------------------------------------------------------
noremap  <silent> <s-tab>       :if &modifiable && !&readonly && 
     \                      &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
inoremap <silent> <s-tab>  <C-C>:if &modifiable && !&readonly && 
     \                      &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
"-------------------------------------------------------------------------------
" Leave the editor with Ctrl-q (KDE): Write all changed buffers and exit Vim
"-------------------------------------------------------------------------------
nnoremap  <C-q>    :wqall<CR>
nmap      <C-q>    :wqa<CR>
"-------------------------------------------------------------------------------
" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
"-------------------------------------------------------------------------------
" Function key hot keys
"
" For use of Shift-Fkey on termainal follow:
" http://vim.wikia.com/wiki/Mapping_fast_keycodes_in_terminal_Vim
"-------------------------------------------------------------------------------
" Shift-F2   -  Provided by c.vim (c-support) plugin
"       F4   -  display next colourscheme
" Shift-F4   -  display previous colourscheme
"       F5   -  
"       F6   -  Show/hide NERDTree
" Shift-F6   -  Show/hide MiniBufferExplorer
"       F7   -  open quickfix error window
" Shift-F7   -  close quickfix error window
"       F8   -  display next error   
" Shift-F8   -  display previous error
"       F9   -  Provided by c.vim (c-support) plugin
" Shift-F9   -  Provided by c.vim (c-support) plugin
"  Ctrl-F9   -  Provided by c.vim (c-support) plugin
"   Alt-F9   -  Provided by c.vim (c-support) plugin
"       F10  -  
" Shift-F10  -  
"       F11  -  Show/hide Taglist window
" Shift-F11  -  show tag under curser in the preview window (tagfile must exist!)
"       F12  -  write file without confirmation
" Shift-F12  -  
"-------------------------------------------------------------------------------
map      <silent> <F4>        :NEXTCOLOR<cr>
map      <silent> <S-F4>      :PREVCOLOR<cr>

map      <silent> <F6>        :NERDTreeToggle<CR>
map      <silent> <S-F6>      :MBEToggle<CR>
map      <silent> <F7>        :copen<CR>
map      <silent> <S-F7>      :cclose<CR>
map      <silent> <F8>        :cn<CR>
map      <silent> <S-F8>      :cp<CR>
noremap  <silent> <F11>       <Esc><Esc>:TlistToggle<CR>
nmap     <silent> <S-F11>     :exe ":ptag ".expand("<cword>")<CR>
map      <silent> <F12>       :write<CR>

imap     <silent> <F6>        <Esc>:NERDTreeToggle<CR>
map      <silent> <S-F6>      <Esc>:MBEToggle<CR>
imap     <silent> <F7>        <Esc>:copen<CR>
imap     <silent> <S-F7>      <Esc>:cclose<CR>
imap     <silent> <F8>        <Esc>:cn<CR>
imap     <silent> <S-F8>      <Esc>:cp<CR>
inoremap <silent> <F11>       <Esc><Esc>:TlistToggle<CR>
imap     <silent> <S-F11>     <Esc>:exe ":ptag ".expand("<cword>")<CR>
imap     <silent> <F12>       <Esc>:write<CR>
"-------------------------------------------------------------------------------
" comma always followed by a space
"-------------------------------------------------------------------------------
inoremap  ,  ,<Space>
"-------------------------------------------------------------------------------
" autocomplete parenthesis, brackets and braces
"-------------------------------------------------------------------------------
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
vnoremap ( s()<Esc>P<Right>%
vnoremap [ s[]<Esc>P<Right>%
vnoremap { s{}<Esc>P<Right>%
"-------------------------------------------------------------------------------
" autocomplete quotes (visual and select mode)
"-------------------------------------------------------------------------------
xnoremap  '  s''<Esc>P<Right>
xnoremap  "  s""<Esc>P<Right>
xnoremap  `  s``<Esc>P<Right>
"-------------------------------------------------------------------------------
" Change the working directory to the directory containing the current file
"-------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufEnter * :lchdir %:p:h
endif " has("autocmd")
"-------------------------------------------------------------------------------
" Moving cursor to other windows
" 
" shift down   : change window focus to lower one (cyclic)
" shift up     : change window focus to upper one (cyclic)
" shift left   : change window focus to one on left
" shift right  : change window focus to one on right
"-------------------------------------------------------------------------------
nmap <s-down>   <c-w>w
nmap <s-up>     <c-w>W
nmap <s-left>   <c-w>h
nmap <s-right>  <c-w>l
"-------------------------------------------------------------------------------
" toggle insert mode <--> 'normal mode with the <RightMouse>-key
"-------------------------------------------------------------------------------
nmap	<RightMouse> <Insert>
imap	<RightMouse> <ESC>
"-------------------------------------------------------------------------------
" MiniBufferExplorer key mapping(s))
"-------------------------------------------------------------------------------
map <Leader>f :MBEFocus<cr>
"-------------------------------------------------------------------------------

"
"  PLUGIN SETTINGS 
"

" c.vim c-support settings
"g:C_GlobalTemplateFile     plugin_dir.'c-support/templates/Templates'
"g:C_LocalTemplateFile      $HOME.'/.vim/c-support/templates/Templates'
"g:C_TemplateOverwrittenMsg 'yes'
"g:C_Ctrl_j                 'on'
"
"g:C_CodeSnippets           plugin_dir.'/c-support/codesnippets/'
"g:C_Dictionary_File        ''
"g:C_LoadMenus              'yes'
"g:C_MenuHeader             'yes'
"g:C_OutputGvim             'vim'
"g:C_Root                   '&C\/C\+\+.'
"g:C_XtermDefaults          '-fa courier -fs 12 -geometry 80x24'
"g:C_Printheader            "%<%f%h%m%<  %=%{strftime('%x %X')}     Page %N"
"g:C_MapLeader              '\'
"g:C_GuiSnippetBrowser      'gui'
"g:C_GuiTemplateBrowser     'gui'
"
"Linux/UNIX:
" g:C_ObjExtension          '.o'
" g:C_ExeExtension          ''
" g:C_CCompiler             'gcc'
" g:C_CplusCompiler         'g++'
" g:C_Man                   'man'
"Windows:
" g:C_ObjExtension          '.obj'
" g:C_ExeExtension          '.exe'
" g:C_CCompiler             'gcc.exe'
" g:C_CplusCompiler         'g++.exe'
" g:C_Man                   'man.exe'
"g:C_VimCompilerName        gcc
"g:C_CFlags                 '-Wall -g -O0 -c'
"g:C_LFlags                 '-Wall -g -O0'
"g:C_Libs                   '-lm'
"g:C_LineEndCommColDefault  49
"g:C_CExtension             'c'
"g:C_TypeOfH                'cpp'
"g:C_SourceCodeExtensions   'c cc cp cxx cpp CPP c++ C i ii'
"
"g:C_CodeCheckExeName       'check'
"g:C_CodeCheckOptions       '-K13'

"
" LocateOpen settings
let g:locateopen_ignorecase = 1
let g:locateopen_smartcase = 0
let g:locateopen_alwaysprompt = 1
" :let g:locateopen_database = "my.db"
let g:locateopen_exactly = 0


" MiniBufExpl settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" SuperTab settings
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"


" NERDCommenter settings
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" NERDTree settings 
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" vim-gitgutter settings
set updatetime=100

" c.vim settings
let  g:C_UseTool_cmake    = 'yes'
let  g:C_UseTool_doxygen = 'yes'

" Taglist settings
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select 				= 1
let tlist_make_settings  = 'make;m:makros;t:targets'
let tlist_qmake_settings = 'qmake;t:SystemVariables'

if has("autocmd")
  " ----------  qmake : set filetype for *.pro  ----------
  autocmd BufNewFile,BufRead *.pro  set filetype=qmake
endif " has("autocmd")

" pgsql PostgreSQL SQL plugin
let g:sql_type_default = 'pgsql'

" LargeFile settings
let g:LargeFile = 20  " size in MByte
