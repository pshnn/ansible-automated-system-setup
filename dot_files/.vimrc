" Install vim-plug if absent
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'editorconfig/editorconfig-vim'
  Plug 'morhetz/gruvbox'
  Plug 'vim-crystal/vim-crystal'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'mxw/vim-jsx'
  Plug 'mattn/emmet-vim'
  Plug 'preservim/nerdcommenter'
  Plug 'dense-analysis/ale'
  Plug 'tpope/vim-surround'
  Plug 'easymotion/vim-easymotion'
  Plug 'pangloss/vim-javascript'
  Plug 'airblade/vim-localorie'
  Plug 'slim-template/vim-slim'
  Plug 'vim-airline/vim-airline'
call plug#end()


"" General settings

" Theme
colorscheme gruvbox
set background=dark

" Line numbers
set number relativenumber

" Line length
set colorcolumn=81

" Folding
set foldmethod=indent
set foldlevel=99

" Finding files
set path=app/**,spec/**
set wildmenu


"" Mappings
" Ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" vim-localorie
nnoremap <silent> <leader>lt :call localorie#translate()<CR>
nnoremap <silent> <leader>le :echo localorie#expand_key()<CR>
nnoremap <silent> <leader>lr :call localorie#load_translations()<CR>


"" Commands
" ctags
command! MakeTags !ctags -R .


"" Plugin Settings

"" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

"" A.L.E.
" Linters
let g:ale_linters = {
\   'ruby': ['rubocop'],
\   'yaml': ['yamllint'],
\   'javascript': ['eslint']
\}

" Fixers
let g:ale_fixers = {
\   'ruby': ['rubocop']
\}

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
" Lint only on file save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" Keep the sign gutter open at all times
let g:ale_sign_column_always = 1
