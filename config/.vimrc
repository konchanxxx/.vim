" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" 末尾空白削除
autocmd BufWritePre * :%s/\s\+$//ge
" 複数行インデント
set shiftwidth=4
" クリップボード有効
set clipboard+=unnamed

" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
" set cursorline
" 現在の行を強調表示（縦）
" set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2

" 追加
" 補完メニューの高さ
set pumheight=10
" 括弧確認
set showmatch
set matchtime=1


" NERDtree
autocmd vimenter * NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden = 1

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" key map
nnoremap :sp :split
nnoremap :vsp :vsplist
nnoremap :clo :close
nnoremap <silent><C-e> :NERDTreeToggle<CR>

execute pathogen#infect()

" Plugin
" Note: Skip initialization for vim-tiny or vim-small.
" if 0 | endif
"
" filetype off
"
" if has('vim_starting')
"   if &compatible
"     set nocompatible               " Be iMproved
"   endif
"
"   set runtimepath+=~/.vim/bundle/neobundle.vim
" endif
"
" call neobundle#begin(expand('~/.vim/bundle/'))
"
" " originalrepos on github
" NeoBundle 'Shougo/neobundle.vim'
" NeoBundle 'Shougo/vimproc', {
"   \ 'build' : {
"     \ 'windows' : 'make -f make_mingw32.mak',
"     \ 'cygwin' : 'make -f make_cygwin.mak',
"     \ 'mac' : 'make -f make_mac.mak',
"     \ 'unix' : 'make -f make_unix.mak',
"   \ },
"   \ }
" NeoBundle 'VimClojure'
" NeoBundle 'Shougo/vimshell'
" NeoBundle 'Shougo/unite.vim'
" NeoBundle 'Shougo/neocomplcache'
" NeoBundle 'Shougo/neosnippet'
" NeoBundle 'jpalardy/vim-slime'
" NeoBundle 'scrooloose/syntastic'
" NeoBundle 'Shougo/vimfiler.vim'
" NeoBundle 'itchyny/lightline.vim'
" NeoBundle 't9md/vim-textmanip'
" NeoBundle 'Shougo/unite.vim'
" NeoBundle 'ujihisa/unite-colorscheme'
" NeoBundle 'tomasr/molokai'
" NeoBundle 'airblade/vim-gitgutter'
" NeoBundle 'scrooloose/nerdtree'
"
" call neobundle#end()
"
filetype plugin indent on     " required!
filetype indent on

" dein
" Vim起動完了時にインストール
augroup PluginInstall
  autocmd!
  autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END

" 各プラグインをインストールするディレクトリ
let s:plugin_dir = expand('~/.vim/')

" dein.vimをインストールするディレクトリをランタイムパスへ追加
let s:dein_dir = s:plugin_dir . 'repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_dir

" dein.vimがまだ入ってなければ 最初に git clone
if !isdirectory(s:dein_dir)
  call mkdir(s:dein_dir, 'p')
  silent execute printf('!git clone %s %s', 'https://github.com/Shougo/dein.vim', s:dein_dir)
endif

"dein plugin settings
if dein#load_state(s:plugin_dir)
  call dein#begin(s:plugin_dir)
endif

" ここからインストールするプラグイン
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplcache.vim')
call dein#add('Shougo/neocomplcache-rsense.vim')
call dein#add('VimClojure')
call dein#add('Shougo/vimshell')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neosnippet')
call dein#add('jpalardy/vim-slime')
call dein#add('scrooloose/syntastic')
call dein#add('Shougo/vimfiler.vim')
call dein#add('itchyny/lightline.vim')
call dein#add('t9md/vim-textmanip')
call dein#add('Shougo/unite.vim')
call dein#add('ujihisa/unite-colorscheme')
call dein#add('tomasr/molokai.vim')
call dein#add('airblade/vim-gitgutter')
call dein#add('scrooloose/nerdtree')
call dein#add('tpope/vim-endwise/plugin/endwise.vim')

" neocomplcacheの設定
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1

" Rsense用の設定
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

"rsenseのインストールフォルダがデフォルトと異なるので設定
let g:rsenseHome = expand("~/.rbenv/shims/rsense")
let g:rsenseUseOmniFunc = 1

" カラースキーマ
colorscheme molokai
syntax on
let g:molokai_original=1
let g:rehash256=1
set background=dark
