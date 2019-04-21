" Environment {
  " Basics {
      set nocompatible        " Must be first line
  " }
" }

" Use bundles config {
  if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
  endif
" }

" General {
  filetype plugin indent on   " Automatically detect file types.
  syntax on                   " Syntax highlighting
  set mouse=                  " Automatically enable mouse usage
  set mousehide               " Hide the mouse cursor while typing
  set encoding=utf-8
  scriptencoding utf-8
  set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
  set virtualedit=onemore     " Allow for cursor beyond last character
  set colorcolumn=120         " Set right margin
  set history=1000            " Store a ton of history (default is 20)
  set nospell                 " Spell checking off
  set hidden                  " Allow buffer switching without saving

  " Centralize backups, swapfiles and undo history
  set backupdir=~/.vim/backups
  set directory=~/.vim/swaps
  if exists("&undodir")
    set undodir=~/.vim/undo
  endif

  " Don’t create backups when editing files in certain directories
  set backupskip=/tmp/*,/private/tmp/*
" }

" VIM UI {
  "set showmode                " Display the current mode
  set cursorline              " Highlight current line
  highlight clear SignColumn  " SignColumn should match background

  highlight clear LineNr      " Current line number row will have same background color in relative mode
  let g:CSApprox_hook_post = ['hi clear SignColumn']

  set ruler                   " Show the ruler
  set showcmd                 " Show partial commands in status line and

  set laststatus=2

  set nu                      " Line numbers on
  "set incsearch
  set hlsearch
  set ignorecase              " Case insensitive search
  set wildmenu                " Show list instead of just completing
  set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
  set scrolljump=5            " Lines to scroll when cursor leaves screen
  set scrolloff=3             " Minimum lines to keep above and below cursor
  set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:>,precedes:< " Show “invisible” characters
  set list

  set wildignore+=*/tmp/*
  set wildignore+=*/.sass-cache/*

  " Use relative line numbers
  if exists("&relativenumber")
    set relativenumber
    au BufReadPost * set relativenumber
  endif
" }

" Formatting {
  set nowrap                  " Do not wrap long lines
  set shiftwidth=2            " Use indents of 4 spaces
  set expandtab               " Tabs are spaces, not tabs
  set tabstop=2               " An indentation every four columns
  set softtabstop=2           " Let backspace delete indent

"  set splitright              " Puts new vsplit windows to the right of the current
"  set splitbelow              " Puts new split windows to the bottom of the current

  autocmd BufNewFile,BufRead *.coffee set filetype=coffee
  autocmd BufNewFile,BufRead *.hamlc set filetype=haml

  " Strip trailing whitespace (,ss)
  function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
  endfunction
" }

" GUI Settings {
  if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
  endif
" }

" Key Mappings {

  " disable recording
  map q <Nop>

  " Visual shifting (does not exit Visual mode)
  vnoremap < <gv
  vnoremap > >gv

  map <C-p> :Files<CR>
  map <Leader>m :Buffers<CR>
  map <Leader>s :w<CR>
  map <Leader>v <C-w>v
  map <Leader>h <C-w>s

  noremap <leader>sw :call StripWhitespace()<CR>

  " Map <Leader>ff to display all lines with keyword under cursor
  " and ask which one to jump to
  nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" }

" Plugins {

  " NerdTree {
    map <C-e> :NERDTreeToggle<CR>
    map <leader>e :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeFind<CR>

    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.idea', '\.sass-cache']
    let NERDTreeChDirMode=0
    let NERDTreeQuitOnOpen=0
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0
    let NERDTreeShowLineNumbers=1
  " }

  " Airline {
  "    let g:airline_powerline_fonts = 1
  " }
  " HardMode {
      autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
      let g:HardMode_level = 'wannabe'
  " }
  " Hardtime {
      let g:hardtime_default_on = 1
  " }
  " Syntastic {
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['java'] }
" }
