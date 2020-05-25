set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
" Plugin 'tpope/vim-commentary' " gc to comment out
Plugin 'pangloss/vim-javascript'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'luochen1990/rainbow'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-entire'
Plugin 'szw/vim-g'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jamesroutley/vim-logbook'
Plugin 'sheerun/vim-polyglot'   " syntax highlighting in most languages
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/emmet-vim'
Plugin 'elzr/vim-json'

" themes
Plugin 'patstockwell/vim-monokai-tasty'
Plugin 'morhetz/gruvbox'
Plugin 'joshdick/onedark.vim'

" Plugin 'dense-analysis/ale'
Plugin 'mrmargolis/dogmatic.vim' "disable arrow keys 
Plugin 'junegunn/fzf'
Plugin 'styled-components/vim-styled-components'
Plugin 'mxw/vim-jsx'
Plugin 'prettier/vim-prettier'
Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plugin 'ryanoasis/vim-devicons'


call vundle#end()
filetype plugin indent on

" THEME
syntax on
set background=dark
colorscheme vim-monokai-tasty
" colorscheme gruvbox
" colorscheme onedark
" :let g:airline_theme='gruvbox'
" let g:gruvbox_contrast_dark = 'hard'

hi normal   ctermfg=white  ctermbg=black
hi CursorLine   cterm=NONE ctermbg=233 guibg=darkred
hi VertSplit ctermbg=NONE guibg=NONE
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
" set relativenumber 
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

" font settings for powerline & air-line
let g:airline_powerline_fonts = 1
let g:airline_theme='jellybeans'
" let g:airline_theme='simple'

" NERDTree shortcut on ,ne
let mapleader = ","
nmap <leader>ne :NERDTree<cr>

" FZF shortcut on ,f
nmap <leader>f :FZF<cr>

"rainbow Plugin Options (luochen1990/rainbow)
let g:rainbow_active=1    " 0 if you want to enable it later via :RainbowToggle
let g:gitgutter_realtime=1

"prettier optioins
let g:prettier#autoformat = 0
autocmd BufWritePre *.cpp,*.h,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
let g:prettier#exec_cmd_async = 1
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#semi = 'true'

" Commenting shortcuts
autocmd FileType javascript,c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_powerline_fonts = 1 " enable deviicons for powerline

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
