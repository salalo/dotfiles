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
set nohlsearch
set wildmenu
set splitbelow
set splitright
set wildmode=list:longest,list:full

call plug#begin()

" Language support
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'elixir-editors/vim-elixir'
Plug 'leafgarland/typescript-vim' "TypeScript syntax
Plug 'sheerun/vim-polyglot' "syntax highlighting in most languages
Plug 'slashmili/alchemist.vim'
Plug 'tpope/vim-endwise' "Closing blocks like do end
Plug 'alvan/vim-closetag'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Themes
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Tools
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'codota/tabnine-vim'
Plug 'tpope/vim-fugitive'
Plug 'wakatime/vim-wakatime'
Plug 'preservim/nerdcommenter' "commenting ,cc ,cu
Plug 'prettier/vim-prettier'
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree'
Plug 'kshenoy/vim-signature'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'

call plug#end()

" THEME
colorscheme codedark
set re=0 "typescript syntax hidhlight fix
set t_Co=256
set background=dark
let g:airline_theme = 'codedark'

hi CursorLine cterm=NONE ctermbg=233
hi CursorLineNR ctermbg=NONE ctermfg=white
hi Normal ctermfg=white  ctermbg=NONE
hi LineNr ctermfg=darkgrey ctermbg=NONE
hi SignColumn cterm=NONE ctermbg=NONE
hi EndOfBuffer cterm=NONE ctermbg=NONE
hi VertSplit ctermbg=NONE guibg=NONE

" Formatting
let g:closetag_filenames = '*.html,*.xhtml,*.eex, *.leex, *.heex'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:prettier#autoformat = 1
let g:rustfmt_autosave = 1
let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#semi = 'true'
autocmd BufWritePre *.cpp,*.h,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue silent PrettierAsync
autocmd BufWritePost *.exs,*.ex silent :!mix format %

" Coc
let g:coc_global_extensions = ['coc-tsserver', 'coc-jest', 'coc-css', 'coc-prettier', 'coc-eslint', 'coc-json', 'coc-elixir', 'coc-clangd', 'coc-rls',  'coc-rust-analyzer', 'coc-tabnine']
autocmd CursorHold * silent call CocActionAsync('highlight')
"let g:coc_disable_startup_warning = 1

let g:gitgutter_realtime=1
let g:netrw_winsize=80
let g:netrw_preview=1
let g:netrw_altv=1

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


" FZF with proximity sorting
function! g:FzfFilesSource()
  let l:base = fnamemodify(expand('%'), ':h:.:S')
  let l:proximity_sort_path = $HOME . '/.cargo/bin/proximity-sort'
  return base == '.' ? 'rg --files' : printf('rg --files | %s %s', l:proximity_sort_path, expand('%'))
endfunction

nmap <leader>f :call fzf#vim#files('', {
      \ 'source': g:FzfFilesSource(),
      \ 'options': '--tiebreak=index'})<CR>

" Keymaps
vnoremap <leader>y "*y
nmap <leader>k <C-]>
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gD <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nmap <leader>f :FZF<cr>
nmap <leader>w :bw<cr>
nmap <leader>g :Rg<cr>
nmap <leader>d :Buffers<cr>
nmap <leader>u :UndotreeToggle<cr>
nmap <leader>e :Explore<cr>
nmap <leader>r :Rexplore<cr>
nmap <leader>sc :Git commit<cr>
nmap <leader>sp :Git push<cr>
