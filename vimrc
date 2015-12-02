" -----------------------------------------------
" Neobundle
" -----------------------------------------------
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))


NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \   'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin'  : 'make -f make_cygwin.mak',
  \     'mac'     : 'make -f make_mac.mak',
  \     'unix'    : 'make -f make_unix.mak',
  \   },
  \ }

NeoBundle 'thinca/vim-quickrun'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
"NeoBundle 'Shougo/vimfiler'
"NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neocomplcache'

NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'tsukkee/unite-tag'

NeoBundle 'The-NERD-tree'
NeoBundle 'The-NERD-Commenter'

NeoBundle 'bkad/CamelCaseMotion'
NeoBundle 'Align'
NeoBundle 'taichouchou2/vim-endwise.git'
NeoBundle 'vim-scripts/ruby-matchit'
NeoBundle 'tpope/vim-surround'

" Git
NeoBundle 'tpope/vim-fugitive'

" Ruby/Rails
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'basyura/unite-rails'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'kchmck/vim-coffee-script'

" NeoBundle 'scrooloose/syntastic'
"
NeoBundle 'markcornick/vim-terraform'

" Statusline
NeoBundle 'itchyny/lightline.vim'

" ColorSchemes
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'shelling/railscasts.vim'

NeoBundle 'nathanaelkane/vim-indent-guides'

NeoBundle 'itchyny/calendar.vim'

call neobundle#end()
filetype plugin indent on
syntax on

" Edit vimrc
nmap <Space>e :edit $MYVIMRC<CR>
nmap <Space>s :source $MYVIMRC<CR>

" 表示
set title                         " タイトルを表示
set number                        " 行番号を表示
set ruler                         " ルーラーを表示
set noswapfile                    " swapをつくらない
set hidden                        " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start    " backspaceで消せるようにする
set vb t_vb=                      " ビープ音を鳴らさない
set clipboard=unnamed             " OSのクリップボードを使用する

" 不可視文字表示
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<
highlight link ZenkakuSpace Error
match ZenkakuSpace /　/

" タブ
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=0

" 折り畳み
set foldmethod=marker
nmap <silent> ,fc :<C-U>%foldclose<CR>
nmap <silent> ,fo :<C-U>%foldopen<CR>

" StatusLine
set noshowmode
set noshowcmd
set laststatus=2

" 検索設定
set incsearch
set ignorecase
set smartcase
set wrapscan

" Color
set t_Co=256
colorscheme hybrid

" 移動を直感的に
set whichwrap=b,s,h,l,<,>,[,]
nnoremap <silent> j gj
nnoremap <silent> gj j
nnoremap <silent> k gk
nnoremap <silent> gk k
nnoremap <silent> $ g$
nnoremap <silent> g$ $
vnoremap <silent> j gj
vnoremap <silent> gj j
vnoremap <silent> k gk
vnoremap <silent> gk k
vnoremap <silent> $ g$
vnoremap <silent> g$ $

" Unite
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200

nnoremap [unite] <Nop>
nmap     <Space>u [unite]

nnoremap [unite]u :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap [unite]b :<C-u>Unite buffer<CR>
nnoremap [unite]y :<C-u>Unite history/yank<CR>
nnoremap [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap [unite]r :<C-u>Unite -buffer-name=register register<CR>
" nnoremap [unite]u :<C-u>Unite file_mru buffer<CR>

" ESCキーを2回押すとUniteを終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" Unite-rails
nnoremap [unite-rails] <Nop>
nmap     <Space>r [unite-rails]
nnoremap [unite-rails]m :<C-u>Unite rails/model<CR>
nnoremap [unite-rails]v :<C-u>Unite rails/view<CR>
nnoremap [unite-rails]c :<C-u>Unite rails/controller<CR>
nnoremap [unite-rails]h :<C-u>Unite rails/helper<CR>
nnoremap [unite-rails]h :<C-u>Unite rails/helper<CR>
nnoremap [unite-rails]l :<C-u>Unite rails/lib<CR>
nnoremap [unite-rails]f :<C-u>Unite rails/config<CR>
nnoremap [unite-rails]s :<C-u>Unite rails/spec<CR>
nnoremap [unite-rails]d :<C-u>Unite rails/db<CR>
nnoremap [unite-rails]a :<C-u>Unite rails/asset<CR>
nnoremap [unite-rails]b :<C-u>Unite rails/bundled_gem<CR>

" NERD Tree
let g:NERDTreeIgnore=['\.git$', '\.swp$', '\~$', '\.keep$', '\.bundle$']
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=0

nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>

" ファイル指定なしで起動するとNERDTreeを開いた状態から始める
" autocmd vimenter * if !argc() | NERDTree | endif

" NERD Commenter
let NERDSpaceDelims = 1

nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_ruby_checkers = ['rubocop']

" LightLine
let g:lightline = {
  \   'colorscheme': 'jellybeans'
  \ }

" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

" Align
let g:Align_xstrlen=3

" Fugitive
nnoremap [git] <Nop>
nmap     <Space>g [git]
nnoremap [git]d :<C-u>Gdiff HEAD<Enter>
nnoremap [git]s :<C-u>Gstatus<Enter>
nnoremap [git]l :<C-u>Glog<Enter>
nnoremap [git]a :<C-u>Gwrite<Enter>
nnoremap [git]c :<C-u>Gcommit<Enter>
nnoremap [git]C :<C-u>Git commit --amend<Enter>
nnoremap [git]b :<C-u>Gblame<Enter>

" Neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1

let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ 'ruby'    : $HOME . '/.vim/dict/ruby.dict',
  \ 'php'     : $HOME . '/.vim/dict/php.dict'
  \ }

if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h>   neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS>    neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>   neocomplcache#close_popup()
inoremap <expr><C-e>   neocomplcache#cancel_popup()
inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"
autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby          setlocal omnifunc=rubycomplete#CompleteTags

" Indent Guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size  = 1
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=black

" Local settings
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction
