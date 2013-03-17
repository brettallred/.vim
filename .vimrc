"::PATHOGEN
execute pathogen#infect()
syntax on
filetype plugin indent on


"::NERDTREE
map <F2> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree "open nerd tree on open vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif "close vim if nerdtree is last file open

"http://www.elonflegenheimer.com/2012/09/16/navigating-ruby-projects-in-vim.html
set tags+=./tags
:nnoremap <C-F12> :!ctags -R --exclude=.git --exclude=logs --exclude=doc .<CR>
au BufRead,BufNewFile *.rb setlocal tags+=~/.vim/tags/ruby_and_gems
:nnoremap <leader>t :TlistToggle<CR>

"::PERSONAL MAPPINGS
let mapleader = ","
:nnoremap <leader>ev :vsplit $MYVIMRC<cr> 
:nnoremap <leader>sv :source $MYVIMRC<cr>
:inoremap jk <esc>

"::PERSONAL_SETTINGS
autocmd InsertEnter,InsertLeave * set cul!
colorscheme grb256

"::Janus:Basic Setup
set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

"::Janus:Whitespace
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert
mode

if exists("g:enable_mvim_shift_arrow")
	  let macvim_hig_shift_movement = 1 " mvim shift-arrow-keys
endif

"::Janus:List Chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen

"::Janus:Searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

"::Janus Wild settings

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

"::Janus:Backup and swap files
set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.

"::JANUS:STATUS LINE
if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Start the status line
  set statusline=%f\ %m\ %r
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
endif
