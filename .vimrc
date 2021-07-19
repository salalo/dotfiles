set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

let g:coc_disable_startup_warning = 1
let mapleader = ","

" Language support
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'    " JavaScript support
Plugin 'elixir-editors/vim-elixir'
Plugin 'mhinz/vim-mix-format'

"Plugin 'elixir-editors/vim-elixir'
" Plugin 'leafgarland/typescript-vim' " TypeScript syntax
" Plugin 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
" Plugin 'jparise/vim-graphql'        " GraphQL syntax
" Plugin 'tpope/vim-commentary' " gc to comment out
" Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'styled-components/vim-styled-components'
Plugin 'mxw/vim-jsx'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-entire'
Plugin 'szw/vim-g'
Plugin 'jamesroutley/vim-logbook'
Plugin 'sheerun/vim-polyglot'   " syntax highlighting in most languages
Plugin 'mattn/emmet-vim'
Plugin 'elzr/vim-json'

" themes
Plugin 'patstockwell/vim-monokai-tasty'
" Plugin 'morhetz/gruvbox'
" Plugin 'joshdick/onedark.vim'
Plugin 'tomasiser/vim-code-dark'

" Tools
Plugin 'codota/tabnine-vim'
Plugin 'wakatime/vim-wakatime'
" Plugin 'dense-analysis/ale'
Plugin 'neoclide/coc.nvim', {'branch': 'release'} " autocomplete suggestion
" Plugin 'mrmargolis/dogmatic.vim' "disable arrow keys 
Plugin 'preservim/nerdcommenter' "commenting plugin ,cc ,cu
Plugin 'junegunn/fzf'
Plugin 'prettier/vim-prettier'
Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'luochen1990/rainbow'
Plugin 'airblade/vim-gitgutter'
" Plugin 'ryanoasis/vim-devicons'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'simeji/winresizer'

call vundle#end()
filetype plugin indent on

" THEME
syntax on
set t_Co=256
set background=dark
"colorscheme codedark
colorscheme vim-monokai-tasty
"colorscheme gruvbox
"colorscheme onedark
"let g:airline_theme='gruvbox'
"let g:gruvbox_contrast_dark='hard'
"font settings for powerline & air-line
"let g:airline_powerline_fonts = 1
"let g:airline_theme='jellybeans'
" let g:airline_theme = 'codedark'
"let g:airline_theme='simple'
let g:airline_theme='monokai_tasty'
"hi normal   ctermfg=white  ctermbg=black
"hi CursorLine   cterm=NONE ctermbg=233
"hi CursorLineNR ctermbg=black ctermfg=white
"hi LineNr   ctermfg=darkgrey ctermbg=black
"hi SignColumn   cterm=NONE ctermbg=black 
"hi EndOfBuffer   cterm=NONE ctermbg=black 
"hi VertSplit ctermbg=NONE guibg=NONE

set updatetime=0    " gitgutter update time
set backspace=indent,eol,start " Bring backspace to life
set number          " Line numbers
set hlsearch        " Highlight whole word when searching
set ignorecase      " Ignore case when searching...
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set cursorline
set relativenumber 
set encoding=utf8
set splitbelow
set splitright
set wildmenu
set wildmode=list:longest,list:full
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set noshowmode " disable showing mode two times
set nohlsearch " disable highlight :noh

" Mix Format (Elixir)
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-jest', 'coc-css', 'coc-prettier', 'coc-eslint', 'coc-json', 'coc-elixir', 'coc-clangd']
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" NERDTree shortcut on ,ne
nmap <leader>ne :NERDTree<cr>

" FZF shortcut on ,f
nmap <leader>f :FZF<cr>

"rainbow Plugin Options (luochen1990/rainbow)
let g:rainbow_active=1    " 0 if you want to enable it later via :RainbowToggle
let g:gitgutter_realtime=1

"prettier optioins
let g:prettier#autoformat = 0
autocmd BufWritePre *.ex,*.exs,*.cpp,*.h,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
let g:prettier#exec_cmd_async = 1
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#semi = 'true'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" set completeopt-=preview

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
    endfunction
    inoremap <silent><expr> <Tab>
          \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<Tab>" :
                      \ coc#refresh()
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
