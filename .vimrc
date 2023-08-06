" system
set number
set showcmd
set wildmenu
set ttimeoutlen=0
set virtualedit=block,onemore
set encoding=UTF-8
set clipboard=unnamed
set clipboard+=unnamedplus
set fileencoding=UTF-8
set termencoding=UTF-8
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认
set fo-=r
" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\" zz" | endif

" search
set hlsearch            " 高亮显示搜索结果
set incsearch           " 开启实时搜索功能
set ignorecase          " 搜索时大小写不敏感
nnoremap <silent> <esc> :noh<return><esc>

" typesetting
set autoindent
set smartindent
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set list


" code
syntax on
syntax enable


call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'neoclide/coc.nvim'

Plug 'jiangmiao/auto-pairs'

Plug 'ryanoasis/vim-devicons'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'voldikss/vim-floaterm'
call plug#end()


" theme
colorscheme dracula
set t_Co=256
set background=dark
set cursorline
"
" kpeymap
nmap <CR> o<Esc>
inoremap jk <Esc>
let mapleader = ' '
nnoremap <leader>s :source $MYVIMRC<cr>
nmap <C-s> :w<CR>
nmap <C-[> :bnext<CR>
nmap <C-]> :bprevious<CR>
nmap <C-w> :bd<CR>

" 分屏窗口移动
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l



" nerdtree
highlight NERDTreeFile ctermfg=14
map <silent> <leader>e :NERDTreeToggle<CR>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'
let NERDTreeShowHidden=1
" nerdtree end

" airline
let laststatus=2  "永远显示状态栏
let g:airline_powerline_fonts = 1  " 支持 powerline 字体
let g:airline#extensions#tabline#enabled = 1 " 显示窗口tab和buffer

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'"
" airline end

" nerdcommenter
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
" nerdcommenter end


"coc
let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = ['coc-clangd',
            \ 'coc-jedi',
            \ 'coc-python',
            \ 'coc-json',
            \ 'coc-vimlsp']
set updatetime=100

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<S-TAB>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

autocmd CursorHold * silent call CocActionAsync('highlight')
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" coc end


" floaterm
noremap <leader>t :call FloatTerm()<CR>
tnoremap <silent> <leader>t <c-\><c-n>:FloatermToggle<cr>

function FloatTerm()
    :w
    :FloatermToggle
endfunction
" floaterm end

