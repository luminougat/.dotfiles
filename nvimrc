"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""" neovim config file
""""""""""" adapted from: https://github.com/archmalet/.dotfiles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Figure out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
    let g:python_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), '\n', '', 'g')
else
    let g:python_host_prog=substitute(system("which python3"), '\n', '', 'g')
endif

" Setup VimPlug {{{ -------------------------
" :PlugInstall = install plugins
" :PlugUpdate = update plugins

if (!filereadable(expand("$HOME/.config/nvim/autoload/plug.vim")))
	call system(expand("curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"))
    autocmd VimEnter * PlugInstall --sync | source $HOME/.config/nvim/init.vim
endif

" }}}


" Get Plugins {{{ -------------------------

call plug#begin('~/.config/nvim/plugged')

" Sensible defaults
Plug 'tpope/vim-sensible'

" Comment out stuff
" gcc = toggle comment single line
" gc = toggle comment visual mode
Plug 'tpope/vim-commentary'

" Colored status bar
Plug 'itchyny/lightline.vim'

" Base16 theme
Plug 'chriskempson/base16-vim'

" Toggle between absolute and relative numbering
" :set number relativenumber
" :set number norelativenumber
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Highlight trailing whitespaces
Plug 'ntpeters/vim-better-whitespace'

" Completion magic
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'chemzqm/denite-extra'
" requires neovim > 3.3.0
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Linting
Plug 'w0rp/ale'

" Python completion
" requires neovim > 3.3.0
" Plug 'zchee/deoplete-jedi', { 'for': 'python' }

" Latex completion
Plug 'lervag/vimtex', { 'for': ['tex', 'plaintex'] }

" Jekyll support
Plug 'tpope/vim-liquid'

" GPG support
Plug 'jamessan/vim-gnupg'

call plug#end()

filetype plugin indent on

" }}}



" Settings {{{ -------------------------

" Make it obvious where 80 characters is
"set textwidth=80
"set colorcolumn=+1

" Enable syntax highlighting
syntax on

" Show line numbers
set number

" Hide abandoned buffers instead of unloading them
"set hidden

" ??
"set concealcursor=""

" Split below and right
set splitbelow
set splitright

" Remap nav between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" The holy Tabs vs Spaces war => giving up ;)
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" }}}


" Plugin settings {{{ -------------------------

" Lightline
set noshowmode

" Base16
let base16colorspace=256
set background=dark
colorscheme base16-default-dark

" Deoplete
let g:deoplete#enable_at_startup = 1

" Clipboard Neovim
set clipboard+=unnamedplus

" }}}

"-----
"visualize tabs and spaces
"set listchars=tab:>-,trail:.,extends:>
" set listchars=tab:¦\ ,trail:…,extends:→
" set list
"-----

" highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
" match ExtraWhitespace /\s\+\%#\@<!$/
" function! RemoveExtraWhiteSpacesAndRetabIndent()
" 	let l:winview = winsaveview()
" 	silent! %s/\s\+$//
" 	silent! RetabIndent
" 	call winrestview(l:winview)
" endfunction
" autocmd BufWritePre *.{tpp,cpp,cc,h,c,java,progh,prog} call RemoveExtraWhiteSpacesAndRetabIndent()
