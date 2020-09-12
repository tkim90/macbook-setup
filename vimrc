set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

set relativenumber
packadd! dracula
syntax enable
colorscheme dracula
set tabstop=2
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab
set nu


Plugin 'christoomey/vim-tmux-navigator'
Plugin 'lmeijvogel/vim-yaml-helper'
Plugin 'airblade/vim-gitgutter'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'chriskempson/base16-vim'
Plugin 'plasticboy/vim-markdown'

Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'

Plugin 'tpope/vim-fugitive'

Plugin 'dense-analysis/ale'

Plugin 'janko-m/vim-test'

Plugin 'easymotion/vim-easymotion'
Plugin 'yuttie/comfortable-motion.vim'

Plugin 'ryanoasis/vim-devicons'

call vundle#end()            " required
filetype plugin indent on    " required

set clipboard=unnamed
" NERDTree
nmap <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let NERDTreeIgnore = [
      \'\.DS_Store$',
      \'\.bundle$',
      \'\.capistrano$',
      \'\.git$',
      \'\.gitkeep$',
      \'\.keep$',
      \'\.routes$',
      \'\.sass-cache$',
      \'\.swo$',
      \'\.swp$',
      \'tags$'
      \]

let g:NERDTreeIndicatorMapCustom = {
      \"Modified"  : "✹",
      \"Staged"    : "✚",
      \"Untracked" : "✭",
      \"Renamed"   : "➜",
      \"Unmerged"  : "═",
      \"Deleted"   : "✖",
      \"Dirty"     : "✗",
      \"Clean"     : "✔︎",
      \'Ignored'   : '☒',
      \"Unknown"   : "?"
      \}

" Load up NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" increase default tree view width
:let g:NERDTreeWinSize=40

" f6 to toggle tree view
nmap <F6> :NERDTreeToggle<CR>

" ctrl+l, ctrl+h to navigate btwn nerdtree tabs
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" CtrlP
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_working_path_mode = 2
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
      \'dir':  '\.git$\|\.hg$\|\.svn$',
      \'file': '\.exe$\|\.so$\|\.dll$',
      \'link': 'some_bad_symbolic_links',
      \}

" vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme = "molokai"

" ┌───────────────────────────────────┐
" │             Settings              │
" └───────────────────────────────────┘

" Completion
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python     set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php        set omnifunc=phpcomplete#CompletePHP
autocmd FileType c          set omnifunc=ccomplete#Complete

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Enable Ale
let g:ale_completion_enabled = 1

" Autoindent with two spaces, always expand tabs
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab

" Folding settings
set nofoldenable

set wildmode=list:longest " make cmdline tab completion similar to bash
set wildmenu " enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ " stuff to ignore when tab completing

" Vertical / horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

set cf " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set history=256 " Number of things to remember in history.
set autowrite " Writes on make/shell commands
set ruler " Ruler on
set nu " Line numbers on
set nowrap " Line wrapping on
set timeoutlen=250 " Time to wait after ESC (default causes an annoying delay)

" Highlight all search results
set incsearch
set hlsearch

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Forcing the use of hjkl keys to navigate
" noremap <Up> <nop>
" noremap <Down> <nop>
" noremap <Left> <nop>
" noremap <Right> <nop>
" inoremap <Up> <nop>
" inoremap <Down> <nop>
" inoremap <Left> <nop>
" inoremap <Right> <nop>

" Highlight long lines
let w:m2=matchadd('Search',   '\%>100v.\+', -1)
let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)

" Relative line numbers in normal mode
set rnu
au InsertEnter * :set nu
au InsertLeave * :set rnu
au FocusLost * :set nu
au FocusGained * :set rnu

" Ignore case in searches
set ignorecase

" Open splits at right side (and below)
set splitright
set splitbelow

" Never ever let Vim write a backup file! They did that in the 70’s.
" Use modern ways for tracking your changes (like git), for God’s sake
set nobackup
set noswapfile

" ┌───────────────────────────────────┐
" │               Theme               │
" └───────────────────────────────────┘

" Fonts for Linux
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
" set guifont=Monospace\ 10

" Fonts for Mac
" set guifont=Monaco\ for\ Powerline:h15
" set guifont=Menlo\ Regular:h16
" set guifont=Hack:h15
" set guifont=Anonymous\ Pro:h17
" set guifont=Inconsolata-dz:h17
" set guifont=Roboto\ Mono\ for\ Powerline:h15

" Don't show the top bar
set guioptions-=T

" Syntax on
syntax on

set list listchars=tab:»·,trail:~,extends:>,precedes:<

if has("gui_running")
  set lines=57
  set columns=237
  set colorcolumn=100
  " Highlight the line and the column of the current position of cursor
  set cursorline
  set cursorcolumn
  hi CursorLine guibg=#222222
  hi CursorColumn guibg=#222222
endif

if has("gui_running") || $TERM == "xterm-256color"
  set t_Co=256
  let base16colorspace=256 " Access colors present in 256 colorspace
  " colorscheme base16-default-dark
  " colorscheme base16-ocean
  " colorscheme base16-tomorrow-night
else
  let g:CSApprox_loaded = 0
endif

" ┌───────────────────────────────────┐
" │             Functions             │
" └───────────────────────────────────┘

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

map  <leader>= :call TrimWhiteSpace()<CR>
map! <leader>= :call TrimWhiteSpace()<CR>

" Sets file types
map  <leader><leader>r :set ft=ruby<CR>
map  <leader><leader>j :set ft=javascript<CR>
map  <leader><leader>h :set ft=html<CR>
map  <leader><leader>y :set ft=yaml<CR>
map  <leader><leader>s :set ft=sh<CR>
map  <leader><leader>t :set ft=text<CR>

" Bind K to search for the word under cursor
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" Auto complete
let g:stop_autocomplete=0

function! Diagram()
  execute ":shell python diagram.py"
endfunction
map <Leader>D :call Diagram()<CR>
nnoremap <F5> :call Diagram()

function! UseSingleQuotes()
  execute ":%s/\"/'/g"
endfunction
map <Leader>' :call UseSingleQuotes()<CR>

function! UseDoubleQuotes()
  execute ":%s/'/\"/g"
endfunction
map <Leader>" :call UseDoubleQuotes()<CR>

function! OpenReadme()
  if filereadable("README.md")
    execute ":tab drop README.md"
  else
    if filereadable("README.rdoc")
      execute ":tab drop README.rdoc"
    else
      if filereadable("README")
        execute ":tab drop README"
      end
    end
  end
endfunction
nnoremap <F8> :call OpenReadme()<CR>
map <Leader>R :call OpenReadme()<CR>

map <Leader>v :tab drop $MYVIMRC<CR>

" Creates parent directories on save
function s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction

augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Comment out current line or selected text (maintaining visual mode after it)
vmap <D-/> gcgv
nmap <D-/> gcc

" ┌───────────────────────────────────┐
" │             Shortcuts             │
" └───────────────────────────────────┘

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Ctrl+R reloads the ~/.vimrc file
nnoremap <F12> :source ~/.vimrc<CR>

" Ctrl+L clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>

"" Improve 'n' command (for searches)
"nmap n nzz
"nmap N Nzz

"" Mappings to move lines: http://vim.wikia.com/wiki/Moving_lines_up_or_down
"nnoremap <D-j> :m .+1<CR>==
"nnoremap <D-k> :m .-2<CR>==
"inoremap <D-j> <Esc>:m .+1<CR>==gi
"inoremap <D-k> <Esc>:m .-2<CR>==gi
"vnoremap <D-j> :m '>+1<CR>gv=gv
"vnoremap <D-k> :m '<-2<CR>gv=gv

" ┌───────────────────────────────────┐
" │        Write file using sudo      │
" └───────────────────────────────────┘
cmap w!! w !sudo tee % >/dev/null

" ┌───────────────────────────────────┐
" │        Syntax Highlighting        │
" └───────────────────────────────────┘
au BufNewFile,BufRead *.template   set filetype=javascript
au BufNewFile,BufRead .pryrc       set filetype=ruby
au BufNewFile,BufRead pryrc        set filetype=ruby
au BufNewFile,BufRead Vagrantfile  set filetype=ruby
au BufNewFile,BufRead .psqlrc      set filetype=sql
au BufNewFile,BufRead psqlrc       set filetype=sql
au BufNewFile,BufRead *.less       set filetype=css
au BufNewFile,BufRead bash_profile set filetype=sh
au BufNewFile,BufRead zprofile     set filetype=sh
au BufNewFile,BufRead *.hbs        set filetype=html
au BufNewFile,BufRead *.yml.sample set filetype=yaml
au BufNewFile,BufRead .env.*       set filetype=sh

"
"
"
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

"
"
"
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

"
"
"
set backspace=start,eol,indent
set mouse=a
set encoding=UTF-8

if exists("$EXTRA_VIM")
  for path in split($EXTRA_VIM, ':')
    exec "source ".path
  endfor
endif

packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
