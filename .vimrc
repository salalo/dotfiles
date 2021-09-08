let mapleader = ","
syntax on
set updatetime=0 "gitgutter update time
set encoding=utf8
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set relativenumber
set nowrap
set number
set cursorline
set smartindent
set incsearch
set wildmenu
set wildmode=list:longest,list:full

call plug#begin()

" Language support
Plug 'elixir-editors/vim-elixir'
Plug 'leafgarland/typescript-vim' "TypeScript syntax
Plug 'sheerun/vim-polyglot' "syntax highlighting in most languages
"Plug 'styled-components/vim-styled-components'
"Plug 'pangloss/vim-javascript' "JavaScript support
"Plug 'mxw/vim-jsx'
"Plug 'elzr/vim-json'
"Plug 'jparise/vim-graphql' "GraphQL syntax
"Plug 'maxmellon/vim-jsx-pretty' "JS and JSX syntax
"Plug 'mhinz/vim-mix-format'

" Themes
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'patstockwell/vim-monokai-tasty'
"Plug 'morhetz/gruvbox'

" Tools
Plug 'neoclide/coc.nvim', {'branch': 'release'} " autocomplete suggestion
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'codota/tabnine-vim'
Plug 'wakatime/vim-wakatime'
Plug 'preservim/nerdcommenter' "commenting ,cc ,cu
Plug 'prettier/vim-prettier'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'
"Plug 'mattn/emmet-vim'
"Plug 'szw/vim-g'
"Plug 'tpope/vim-surround'
"Plug 'luochen1990/rainbow'
"Plug 'simeji/winresizer'
"Plug 'dense-analysis/ale'
"Plug 'scrooloose/nerdtree'
"Plug 'xuyuanp/nerdtree-git-Plug'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'ryanoasis/vim-devicons'

call plug#end()

" THEME
colorscheme codedark
set re=0 "typescript syntax hidhlight fix
set t_Co=256
set background=dark
let g:airline_theme = 'codedark'
"colorscheme vim-monokai-tasty
"colorscheme gruvbox
"let g:airline_theme='gruvbox'
"let g:gruvbox_contrast_dark='hard'
hi normal ctermfg=white  ctermbg=black
hi CursorLine cterm=NONE ctermbg=233
hi CursorLineNR ctermbg=black ctermfg=white
hi LineNr ctermfg=darkgrey ctermbg=black
hi SignColumn cterm=NONE ctermbg=black
hi EndOfBuffer cterm=NONE ctermbg=black
hi VertSplit ctermbg=NONE guibg=NONE

" Formatting
let g:prettier#autoformat = 1
let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#semi = 'true'
autocmd BufWritePre *.cpp,*.h,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
autocmd BufWritePost *.exs,*.ex :!mix format --check-equivalent %
"let g:mix_format_on_save = 1
"let g:mix_format_silent_errors = 1

" Coc
let g:coc_global_extensions = ['coc-tsserver', 'coc-jest', 'coc-css', 'coc-prettier', 'coc-eslint', 'coc-json', 'coc-elixir', 'coc-clangd']
autocmd CursorHold * silent call CocActionAsync('highlight')
"let g:coc_disable_startup_warning = 1

let g:gitgutter_realtime=1

" Keymaps
nmap <silent>[g <Plugin>(coc-diagnostic-prev)
nmap <silent>]g <Plugin>(coc-diagnostic-next)
nmap <leader>f :FZF<cr>
nmap <leader>g :Ag<cr>
nmap <leader>u :UndotreeToggle<cr>

" GREATEST TAB COMPLETION
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
