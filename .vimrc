set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" required!
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails.git'
Bundle 'godlygeek/tabular'
Bundle 'groenewege/vim-less'
Bundle 'elzr/vim-json'
Bundle 'jgdavey/vim-blockle'
Bundle 'kana/vim-textobj-user'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/nerdtree'
Bundle 'sickill/vim-pasta'
Bundle 'timcharper/textile.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-vividchalk'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/Gist.vim'
Bundle 'vim-scripts/IndexedSearch'
Bundle 'vim-scripts/jQuery'
Bundle 'vim-scripts/bash-support.vim'
Bundle 'depuracao/vim-rdoc'
Bundle 'Lokaltog/vim-powerline'
Bundle 'slim-template/vim-slim'
Bundle 'tpope/vim-rbenv'
Bundle 'tpope/vim-bundler'
Bundle 'airblade/vim-gitgutter'
Bundle 'tsaleh/vim-shoulda'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-rake'
Bundle 'rking/ag.vim'
Bundle 'jnwhiteh/vim-golang'

" vim-scripts repos
" Bundle 'L9'

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

syntax on
filetype plugin indent on     " required by vundle


nmap <D-t> :tabedit .<CR>

" nocomplcache stuff
" let g:neocomplcache_enable_at_startup = 1

" Snippets still don't work the way I want - tab doesn't jump to next
" placeholder.
" imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" let g:neocomplcache_enable_auto_select = 1
" let g:neocomplcache_auto_completion_start_length = 1
" let g:neocomplcache_enable_auto_select = 0

" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

nmap <C-Left> <C-w>h
nmap <C-Right> <C-w>l

" Powerline
let g:Powerline_symbols = 'fancy'

" CTRL-P
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = 't'
let g:ctrlp_map = '<D-p>'
let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")': [], 'AcceptSelection("t")': ['<cr>', '<c-m>'], }
let g:ctrlp_working_path_mode = 'a'

set clipboard=unnamed " Use the system clipboard
set autoread

let g:rails_menu=2
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Better surround
let g:surround_40 = "(\r)"
let g:surround_91 = "[\r]"
let g:surround_60 = "<\r>"

let g:acp_ignorecaseOption = 0

let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1
let g:SuperTabCrClosePreview = 1

set backspace=indent,eol,start

set backup              " keep a backup file
set backupdir=~/.vim/backups
set history=100         " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set incsearch           " do incremental searching
set expandtab
set shiftwidth=2
set tabstop=2
set helpheight=1000
set list

set completeopt=menu,menuone,preview
set wildmode=longest,list:longest
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.storyboard,*.storyboardc,*/vendor/*,*/build/*

" set cursorcolumn " highlight the screen column of the cursor
" set cursorline   " highlight the screen line of the cursor

setlocal numberwidth=3

map gb <C-^>
vmap gl :<C-U>!blame <C-R>=expand("%:p") <CR> <C-R>=line("'<") <CR> <C-R>=line("'>") <CR> <CR>
vmap # :TComment<CR>
map - :Tabularize hash
map <C-l> :nohl
map <leader>a :Tabularize /=>\?<cr>

" Make j/k move to next visual line instead of physical line
" http://yubinkim.com/?p=6
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

set hlsearch
set listchars=tab:××,trail:×,nbsp:×
set background=dark
colorscheme railscasts
if has("gui_running")
  set lines=80
  set columns=120
  set number
endif

if has("gui_macvim")
  " write on pretty much any event (including :q) 
  set autowriteall
  set tabpagemax=100
  set guifont=Monofur\ for\ Powerline:h18
endif

" Nice statusbar
set laststatus=2
set statusline=
set statusline+=%f\                    " file name
set statusline+=%h%1*%m%r%w%0*         " flags
set statusline+=%=                     " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P  " offset

autocmd BufNewFile,BufRead *.css set fdm=marker fmr={,}
autocmd BufNewFile,BufRead *.md set spell
autocmd BufNewFile,BufRead *.markdown set spell

" Fuck tpope
xmap s <Plug>VSurround

hi IncSearch term=reverse
hi    Search term=reverse
hi    Visual term=reverse cterm=reverse ctermbg=9

" Make required directories when writing a file..
" http://stackoverflow.com/questions/4292733/vim-creating-parent-directories-on-save
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
