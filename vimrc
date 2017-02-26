" Vundle {{{
" next 2 lines are required by Vaundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
let g:vundle_default_git_proto = 'git'
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'jnurmine/Zenburn'               " nice theme
Plugin 'bling/vim-airline'              " powerline fork
Plugin 'ctrlpvim/ctrlp.vim'             " full path fuzzy finder
Plugin 'sjl/gundo.vim'                  " visualize your Vim undo tree
Plugin 'majutsushi/tagbar'              " browse the tags of the current file
"Plugin 'mhinz/vim-signify'              " indicate added, modified and removed lines based on VCS
Plugin 'scrooloose/nerdtree'            " explore your filesystem and to open files and directories
Plugin 'scrooloose/nerdcommenter'       " comment your code 'sexy'
Plugin 'fholgado/minibufexpl.vim'       " buffer tabbed manager
Plugin 'rking/ag.vim'                   " Vim plugin for the_silver_searcher, 'ag', a replacement for the Perl module / CLI script 'ack'
if !has('nvim')
    Plugin 'klen/python-mode'
endif
if has('nvim')
    Plugin 'Shougo/deoplete.nvim'
endif
"Plugin 'davidhalter/jedi-vim'           " Using the jedi autocompletion library for VIM.
Plugin 'tmhedberg/SimpylFold'
Plugin 'chrisbra/vim-diff-enhanced'
Plugin 'vim-scripts/cream-showinvisibles' " Toggle view of invisible tabs, returns, trailing spaces 

" All of your Plugins must be added before the following line
" next 2 lines are required by Vaundle
call vundle#end()
filetype plugin indent on
" }}}

" Common {{{
syntax enable                   " enable syntax highlighting
set backspace=indent,eol,start  " backspace over indent, end of
                                " line and start of insertion
set clipboard=unnamed           " allow normal work with system buffer
set ttyfast                     " fast redraw
set number                      " show line numbers
set showcmd                     " show command in bottom bar (used with powerline)
set wildmenu                    " visual autocomplete for command menu
set lazyredraw                  " redraw only when we need to
set showmatch                   " show matching part of the pair for [] {} ()
filetype indent on              " load filetype-specific indent files
set pastetoggle=<F2>            " toggle paste mode by pressing F2
silent! colors zenburn
" }}}

" Searching {{{
set ignorecase                  " ignore case when searching
set incsearch                   " search as characters are entered
set hlsearch                    " highlight all matches
" }}}

" File & Encoding {{{
set encoding=utf-8              " encoding is utf-8
set fileencoding=utf-8
set fileformat=unix             " set unix line endings
set fileformats=unix,dos
set tenc=utf8
" }}}

" Whitespaces & Indentation {{{
set tabstop=4                   " set tab to 4 spaces
set softtabstop=4               " number of spaces in tab when editing (insert & remove)
set autoindent                  " indent next line while writing code
set expandtab                   " expand tabs into spaces
set shiftwidth=4                " >> or << shifts lines by 4 spaces
" specific indentation
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
" }}}

" Navigation {{{
" tab navigation
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm
map tt :tabnew
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

set scrolloff=4
set ttyfast         " always use a fast terminal
set cursorline      " underline the current line, for quick orientation

" navigate windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

function! NumberToggle()
  if(&relativenumber == 1)
    set relativenumber!
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>
" }}}

" Bindings {{{
let mapleader=','
" map <ESC> to jk
inoremap jk <esc>
" remove search results highlight
nnoremap <leader><space> :noh<CR>
" toggle line numbers on/off
noremap <F3> :set invnumber<CR>
inoremap <F3> <C-O>:set invnumber<CR>
" space open/closes folds
nnoremap <space> za
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
nnoremap <C-d> 10<C-e>
nnoremap <C-u> 10<C-y>
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" ... and '$' / '^' doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" highlight last inserted text
nnoremap gV `[v`]
" toggle GUndo, Tagbar, NERDTree
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>tb :TagbarToggle<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>m :MBEToggle<CR>
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" previous/next buffer
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>
" toggle display of whitespaces
nmap <leader>l :set list!<CR>
" do not discard selection on indentation
vnoremap < <gv
vnoremap > >gv
" save session - reopen it with `vim -S`
nnoremap <leader>s :mksession<CR>
nnoremap <leader>ss :mksession!<CR>
" open ag.vim
nnoremap <leader>a :Ag 
" destroy buffer
nnoremap <C-c> :bp\|bd #<CR>
" locate current tag in tagbar
map <leader>c :TagbarCurrentTag<CR>
" copy current file name (relative/absolute) to system clipboard
if has("mac") || has("gui_macvim") || has("gui_mac")
	nnoremap <leader>fn :let @*=expand("%").":".line(".")<CR>
endif
if has("gui_gtk") || has("gui_gtk2") || has("gui_gnome") || has("unix")
	nnoremap <leader>fn :let @"="\n".expand("%").":".line(".")<CR>
	nnoremap <leader>sn :let @"="\n".expand("%").tagbar#currenttag(' %s ','', 's').":".line(".")<CR>
endif
" }}}

" Folding {{{
set foldenable                  " enable folding
set foldlevelstart=10           " open most folds by default
set foldnestmax=10              " 10 nested fold max
"set foldmethod=indent           " fold based on indent level
" }}}

" Vim file backup {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}

" NERDTree plugin {{{
let NERDTreeIgnore = ['\.pyc$']
map <leader>f :NERDTreeFind<cr>
" }}}

" Airline plugin {{{
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
" }}}

" MiniBuff plugin {{{
let g:miniBufExplStatusLineText=""
let g:miniBufExplCycleArround=1
noremap <C-TAB>   :MBEbn<CR>
noremap <C-S-TAB> :MBEbp<CR>
" }}}

" Signify plugin {{{
let g:signify_vcs_list = [ 'git', 'perforce' ]
let g:signify_line_highlight = 0
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
" bindings
nnoremap <leader>gt :SignifyToggle<CR>
nnoremap <leader>gh :SignifyToggleHighlight<CR>
nnoremap <leader>gr :SignifyRefresh<CR>

" hunk jumping
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
" }}}

" CtrlP plugin {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
" speed up CtrlP with Ag
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" }}}

" Python-Mode plugin {{{
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pylint,pyflakes,pep8"
" Auto check on save
let g:pymode_lint_on_write = 0

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_breakpoint_cmd = 'from pudb import set_trace; set_trace()'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
" }}}

" Cscope {{{
" see :help cscope
if has("cscope")
    set csprg=/usr/local/bin/cscope
    set csto=0
    " set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    if filereadable("pycscope.out")
        cs add pycscope.out
    endif
    set csverb
endif

map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
" }}}

" Ag.vim {{{
" ignore cscope and pycscope
let g:ag_prg="ag --column --nogroup --noheading --ignore='*cscope.out*'"
" }}}

" Cream show invisibles plugin {{{
if !exists("$CREAM")

	" mappings
	imap <silent> <F5> <C-o>:call Cream_list_toggle("i")<CR>
	vmap <silent> <F5> :<C-u>call Cream_list_toggle("v")<CR>
	nmap <silent> <F5>      :call Cream_list_toggle("n")<CR>

	" initialize on Buffer enter/new
	autocmd BufNewFile,BufEnter * call Cream_list_init()

endif
" }}}

" Deoplete {{{
if has('nvim')
    let g:deoplete#enable_at_startup = 1
	inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ deoplete#mappings#manual_complete()
	function! s:check_back_space() abort "{{{
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
	endfunction"}}}

endif
" }}}
" setup folding for .vimrc
" vim:foldmethod=marker:foldlevel=0

