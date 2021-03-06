" Plugins will be downloaded under the specified directory.
call plug#begin('C:\Users\ZHammon\Vim Files\.vim\plugged')

" Declare the list of plugins.
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'scrooloose/syntastic'
" Plug 'sirver/ultisnips' " REQUIRES PYTHON TO RUN
" Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-sensible'
Plug 'dhruvasagar/vim-table-mode'
Plug 'tomtom/tlib_vim'
Plug 'vimwiki/vimwiki'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
 
"Start of Plugin Configuration

" Gruvbox
set background=dark
autocmd vimenter * ++nested colorscheme gruvbox

"vim-rainbow
let g:rainbow_active = 1

"lightline
let g:lightline = {'colorscheme': 'one',}
 
"NerdTree
nnoremap <F6> :NERDTreeToggle<CR>
 
"Nerd Commenter

let g:NERDCreateDefaultMappings = 1

"Indentguides Enabled always
let g:indent_guides_enable_on_vim_startup = 1

"Syntastic Recommended Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Change updatetime for vim-signify
set updatetime=100
 
"VimWiki
set nocompatible
filetype plugin on
syntax on
let wiki = {}
let wiki.path = 'H:\Wiki\'
let wiki.index = 'main'
"let wiki.syntax = 'markdown'
"let wiki.ext = md
let g:vimwiki_list = [wiki]
"let g:vimwiki_global_ext = 0

"End of Plugin Configuration

set encoding=utf-8

" Backup, Swap, and Undo File redirect
set backup
set backupdir=C:\Users\ZHammon\Vim\ Files\Backups\\
set swapfile
set directory=C:\Users\ZHammon\Vim\ Files\Swaps\\
set undofile
set undodir=C:\Users\ZHammon\Vim\ Files\Undos\\

" Set Default FilePath
cd C:\Users\ZHammon\Documents\My_Stuff\Notes\\

" Leader
let mapleader = " "

"Relative Line Numbers
set relativenumber

" Set filepath to path of current open file
autocmd BufEnter * silent! lcd %:p:h

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set modelines=0   " Disable modelines as a security precaution
set nomodeline

filetype plugin indent on

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Numbers
set number
set numberwidth=5

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <Leader>gt :TestVisit<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<Space>

" Treat <li> and <p> tags like the block tags they are
"let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Local config
" if filereadable($HOME . "/.vimrc.local")
"   source ~/.vimrc.local
" endif

" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Clear all registers
function! ClearRegisters()
  let regs='abcdefghijklmnopqrstuvwxyz1234567890/-="*+'
  let i = 0
  while (i<strlen(regs))
    exec 'let @'.regs[i].'=""'
    let i=i+1
  endwhile
endfunction

command! ClearRegisters call ClearRegisters()
                          
" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif

function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
