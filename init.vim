
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

"  set up as an R IDE (sort of)
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'

" better Rnoweb support (LaTeX completion)
Plug 'lervag/vimtex'

" for autocompletion and other good things with python code
Plug 'davidhalter/jedi-vim'
Plug 'ncm2/ncm2-jedi' 

"better indenting for python
Plug 'Vimjas/vim-python-pep8-indent'  

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

" color themes
Plug 'phanviet/vim-monokai-pro'
Plug 'dikiaap/minimalist'
Plug 'morhetz/gruvbox'

Plug 'scrooloose/nerdtree'

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'vim-airline/vim-airline'

" Used to interactively run python code
" Okay for now, but looking for a better solution
" Could use to run R interactively on a remote server too
Plug 'jpalardy/vim-slime'

Plug 'eigenfoo/stan-vim'

" Initialize plugin system
call plug#end()

set termguicolors
colorscheme gruvbox
set number
set textwidth=70
set fo-=t
set tabstop=4
set shiftwidth=4
set expandtab

let g:pandoc#syntax#conceal#use=0
let g:pandoc#formatting#mode='h'
let g:pandoc#formatting#textwidth=70

let R_assign=3

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" tab to use ncm2 to select
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" configure ncm2 autocompletion to work with vimtex
au User Ncm2Plugin call ncm2#register_source({
        \ 'name' : 'vimtex',
        \ 'priority': 9,
        \ 'subscope_enable': 1,
        \ 'complete_length': 1,
        \ 'scope': ['tex'],
        \ 'mark': 'tex',
        \ 'word_pattern': '\w+',
        \ 'complete_pattern': g:vimtex#re#ncm,
        \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
        \ })

" Make NCM2 faster
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1,1]]
let g:ncm2#matcher = 'substrfuzzy'

" vim_slime configuration
let g:slime_target = "tmux"
let g:slime_python_ipython = 1

" Configure vimtex to compile tex documents
" Make sure nvr is in your path
let g:tex_flavor = 'latex'
let g:vimtex_compiler_progname = 'nvr'

" Configure vimtex to fold code
let g:vimtex_fold_enabled=1

" Disable Jedi-vim autocompletion and enable call-signatures options
" NCM2 is used for auocompletion instead
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"

" setup spell checking
set spelllang=en_us

