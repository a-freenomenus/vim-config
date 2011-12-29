" set encoding
set encoding=utf-8

" infect
call pathogen#infect()

" hide buffers
set hidden

" editor
set nocompatible
set ruler
set number				
set title
set backspace=indent,eol,start
filetype plugin indent on
set nostartofline
set modeline
set modelines=10

" crosshair cursor
autocmd BufEnter * setlocal cursorcolumn
autocmd BufLeave * setlocal nocursorcolumn
autocmd BufEnter * setlocal cursorline
autocmd BufLeave * setlocal nocursorline

" autocomplete
set ofu=syntaxcomplete#Complete

" supertab
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" handle sessions
map <leader>s :mksession! session.vis<CR>
au BufRead *.vis so %

" swp files
if has("win32")
  set backupdir=~/vimfiles/backup
  set directory=~/vimfiles/backup
else
  set backupdir=~/.vim/backup
  set directory=~/.vim/backup
endif

" whitespace
set tabstop=2			
set shiftwidth=2		
set softtabstop=2
set expandtab
set autoindent
set copyindent
set list listchars=tab:\ \ ,trail:·

" search
set hlsearch
set incsearch
set ignorecase
set smartcase
nmap <silent> <leader><leader> :silent :nohlsearch<CR>

" ack for vim
if has("mac")
  let g:ackprg="ack -H --nocolor --nogroup --column"
elseif has("unix")
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
endif

" history
set history=1000
set undolevels=1000

" mouse support
set mouse=a
set ttymouse=xterm2

" colors
syntax on
set background=dark
if &t_Co >= 256
  colorscheme molokai
endif

" status bar
set laststatus=2
set showcmd

" make standards
au FileType make set noexpandtab

" python standards
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" additional ruby extensions
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru,compass.config}
set ft=ruby

" additional js extensions
au BufNewFile,BufRead *.json set ft=javascript

" syntax highlighting & css snippets for less
au BufNewFile,BufRead *.less set ft=less.css

" syntax highlighting & css snippets for scss
au BufNewFile,BufRead *.scss set ft=scss.css

" nfo extension
function! SetFileEncodings(encodings)
  let b:myfileencodingsbak=&fileencodings
  let &fileencodings=a:encodings
endfunction
function! RestoreFileEncodings()
  let &fileencodings=b:myfileencodingsbak
  unlet b:myfileencodingsbak
endfunction
au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
au BufReadPost *.nfo call RestoreFileEncodings()

" zoomwin
set noequalalways

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" command t
nmap <leader>t :CommandT<CR>
nmap <leader>b :CommandTBuffer<CR>

" html snippets in php templates
au BufRead,BufNewFile *.php set ft=php.html
au BufRead,BufNewFile *.tpl set ft=php.html
au BufRead,BufNewFile *.phtml set ft=php.html

" nerdtree
let NERDTreeIgnore=['.pyc$', '\.rbc$', '\~$']
nmap <silent> <C-t> :NERDTreeToggle<CR>
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
autocmd BufEnter * lcd %:p:h

" nerdtree autoclose
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" invert mark keybinds
nnoremap ' `
nnoremap ` '

" scroll
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" visual line jump
nnoremap k gk
nnoremap j gj
nnoremap <Up> gk
nnoremap <Down> gj

" paste toggle
set pastetoggle=<F2>

" block indent
vmap <leader>] >gv
vmap <leader>[ <gv

" unimpared bubbling
nmap <leader>k [e
nmap <leader>j ]e

" matchit
runtime! macros/matchit.vim

" zencoding
let g:user_zen_leader_key = '<leader>z'
vmap <leader>e <leader>,
imap <leader>e <leader>z,
nmap <leader>e <leader>z,
imap <leader>] <leader>zn
imap <leader>[ <leader>zN
nmap <leader>] <leader>zn
nmap <leader>[ <leader>zN

" close tag with supertab
imap <leader>ct </<tab>

" narrow region
nmap <leader>n :NarrowRegion<CR>
vmap <leader>n :NarrowRegion<CR>
nmap <leader>np :NRPrepare<CR>
vmap <leader>np :NRPrepare<CR>
map <leader>nm :NRMulti<CR>

" nerdcommenter
vmap <leader>/ <leader>cm
imap <leader>/ <leader>c<space>
nmap <leader>/ <leader>c<space>

" gui commands
if has("gui_running")

  " don't beep
  set novb

  " colorscheme
  colorscheme tomorrow

  " improved mac stuff
  if has("mac")
    " open with alfred
    au BufRead *.vis so %
  
    " native color picker
    imap <leader>cp :ColorHEX<CR>
    nmap <leader>cp :ColorHEX<CR>
    imap <leader>cpr :ColorRGB<CR>
    nmap <leader>cpr :ColorRGB<CR>

  endif

  " gui font
  if has("mac")
    set guifont=Monaco:h11
  elseif has("win32")
    set guifont=Consolas:h10
  else
    set guifont=Inconsolata\ 10
  endif

  " don't hide the mousepointer
  if has("unix")
    set nomousehide
  endif

  " indent bind
  if has("mac")
    vmap <D-]> >gv
    vmap <D-[> <gv
  else
    vmap <A-]> >gv
    vmap <A-[> <gv
  endif

  " bubble single line
  if has("mac")
    nmap <D-k> [e
    nmap <D-j> ]e
  else
    nmap <A-k> [e
    nmap <A-j> ]e
  endif

  " zencoding shortcuts
  if has("mac")
    vmap <D-e> <leader>,
    imap <D-e> <leader>z,
    nmap <D-e> <leader>z,
    imap <D-]> <leader>zn
    imap <D-[> <leader>zN
    nmap <D-]> <leader>zn
    nmap <D-[> <leader>zN
  else
    imap <A-]> <leader>zn
    imap <A-[> <leader>zN
    nmap <A-]> <leader>zn
    nmap <A-[> <leader>zN
  endif

  " nerdcommenter toggles
  if has("mac")
    vmap <D-/> <leader>cm
    imap <D-/> <leader>c<space>
    nmap <D-/> <leader>c<space>
  else
    vmap <A-/> <leader>cm
    imap <A-/> <leader>c<space>
    nmap <A-/> <leader>c<space>
  endif

  " arrow keys to change viewport
  if has("mac")
    map  <D-S-Up>    <C-w>k
    map  <D-S-Down>  <C-w>j
    map  <D-S-Right> <C-w>l
    map  <D-S-Left>  <C-w>h
    imap <D-S-Up>    <Esc> <C-w>k
    imap <D-S-Down>  <Esc> <C-w>j
    imap <D-S-Right> <Esc> <C-w>l
    imap <D-S-Left>  <Esc> <C-w>h
  else
    map  <A-S-Up>    <C-w>k
    map  <A-S-Down>  <C-w>j
    map  <A-S-Right> <C-w>l
    map  <A-S-Left>  <C-w>h
    imap <A-S-Up>    <Esc> <C-w>k
    imap <A-S-Down>  <Esc> <C-w>j
    imap <A-S-Right> <Esc> <C-w>l
    imap <A-S-Left>  <Esc> <C-w>h
  endif

  " <bind>-# to switch tabs
  if has("mac")
    map  <D-0> 0gt
    imap <D-0> <Esc>0gt
    map  <D-1> 1gt
    imap <D-1> <Esc>1gt
    map  <D-2> 2gt
    imap <D-2> <Esc>2gt
    map  <D-3> 3gt
    imap <D-3> <Esc>3gt
    map  <D-4> 4gt
    imap <D-4> <Esc>4gt
    map  <D-5> 5gt
    imap <D-5> <Esc>5gt
    map  <D-6> 6gt
    imap <D-6> <Esc>6gt
    map  <D-7> 7gt
    imap <D-7> <Esc>7gt
    map  <D-8> 8gt
    imap <D-8> <Esc>8gt
    map  <D-9> 9gt
    imap <D-9> <Esc>9gt
  else
    map  <A-0> 0gt
    imap <A-0> <Esc>0gt
    map  <A-1> 1gt
    imap <A-1> <Esc>1gt
    map  <A-2> 2gt
    imap <A-2> <Esc>2gt
    map  <A-3> 3gt
    imap <A-3> <Esc>3gt
    map  <A-4> 4gt
    imap <A-4> <Esc>4gt
    map  <A-5> 5gt
    imap <A-5> <Esc>5gt
    map  <A-6> 6gt
    imap <A-6> <Esc>6gt
    map  <A-7> 7gt
    imap <A-7> <Esc>7gt
    map  <A-8> 8gt
    imap <A-8> <Esc>8gt
    map  <A-9> 9gt
    imap <A-9> <Esc>9gt
  endif

  " fullscreen fix
  if has("mac")
    set fuoptions=maxhorz,maxvert
  endif

  " remove the toolbar in macvim
  if has("mac")
    set guioptions-=T
  endif

endif
