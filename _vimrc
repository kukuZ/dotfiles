"20140726 Z 
filetype plugin indent on

syntax on

set nowrap
set nobackup
set hlsearch
set noignorecase

set autoindent

set ruler
set number
set list
set wildmenu
set showcmd

set shiftwidth=4
set softtabstop=4
"set expandtap
set tabstop=4
set smarttab

set clipboard=unnamed

" 行を強調表示
set cursorline

" 列を強調表示
"set cursorcolumn



"quickfixの設定
function QfMakeConv()
    let qflist = getqflist()
    for i in qflist
        let i.text = iconv(i.text, "cp936", "utf-8")
    endfor
    call setqflist(qflist)
endfunction

au QuickfixCmdPost make call QfMakeConv()

"undoファイルの設定
set undodir=D:/vim74-kaoriya-win32/koron/var/undo
set undofile
"--------20140726 end

"--------20140727 Z-----------------------
"NeoBundle
"-----------------------------------------
set nocompatible               " be iMproved
filetype off

if has("vim_starting")
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
"ファイルオープン
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'Shougo/unite-outline'
"ファイル操作
NeoBundle 'Shougo/vimfiler'
"NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
"カラースキーマ
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'altercation/vim-colors-solarized'
"pytho補完とか
NeoBundle 'davidhalter/jedi-vim'
"tree
NeoBundle 'scrooloose/nerdtree'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'
"シンタックス
NeoBundle "slim-template/vim-slim"
"シンタックスハイライト：ifdef
NeoBundle 'vim-scripts/ifdef-highlighting'
"grepの早いやつ
NeoBundle 'rking/ag.vim'

"grepの早いやつ
NeoBundle 'mileszs/ack.vim'
NeoBundle 'nazo/pt.vim'

"ハイライト
NeoBundle "t9md/vim-quickhl"
NeoBundle 'vim-jp/cpp-vim', {
            \ 'autoload' : {'filetypes' : 'c'}
            \ }
"NeoBundle "xolox/vim-shell"
"NeoBundle "xolox/vim-misc"
"NeoBundle "vim-scripts/ctags.vim"
"NeoBundle "xolox/vim-easytags"
"なんか必要なやつ
NeoBundle 'Shougo/neosnippet-snippets'

"メモ用
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'fuenor/qfixhowm'

"ステータスライン修飾
NeoBundle 'itchyny/lightline.vim'

"タブページ毎のディレクトリ設定
NeoBundle 'kana/vim-tabpagecd'
"バージョン管理
NeoBundle 'vcscommand.vim'
"置換え
NeoBundle 'thinca/vim-qfreplace'
"コマンド結果を別ファイルに出力
NeoBundle 'tyru/capture.vim'
"ミニマップ
NeoBundle 'koron/minimap-vim'
""Git系
NeoBundle 'cohama/agit.vim'
NeoBundle 'tpope/vim-fugitive.git'
"yank系
NeoBundle 'LeafCage/yankround.vim'
"カッコ閉じる	
NeoBundle 'Townk/vim-autoclose'
"HTMLのやつ
NeoBundle 'mattn/emmet-vim'
"ctrP
NeoBundle 'kien/ctrlp.vim'
"html css js sass系のツール
NeoBundle 'mattn/emmet-vim'
NeoBundle 'surround.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'mattn/webapi-vim'
"NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
"NeoBundle 'taichouchou2/html5.vim'
"NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'

"Markdown系のためのツール
NeoBundle 'tpope/vim-markdown'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kannokanno/previm'

"C言語の構文解析：neocompleteと併用できる
NeoBundle "osyo-manga/vim-marching"

"インデント可視化
NeoBundle "nathanaelkane/vim-indent-guides"
" Installation check.
NeoBundleCheck

call neobundle#end()
filetype on
filetype plugin indent on

" 補完を有効にする
let g:neocomplete#enable_at_startup = 1

" 補完に時間がかかってもスキップしない
let g:neocomplete#skip_auto_completion_time = ""
"inoremap <expr><CR>   pumvisible() ? "\<C-n>" . neocomplete#close_popup()  : "<CR>"
inoremap <expr><CR>   pumvisible() ? neocomplete#close_popup()  : "<CR>"
" neocomplcache
"let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"if has('lua')
" NeoBundleLazy 'Shougo/neocomplete.vim', {
"    \ 'depends' : 'Shougo/vimproc',
"    \ 'autoload' : { 'insert' : 1,}
"    \ }
"endif

"" neocomplcache
"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#auto_completion_start_length    = 3
"let g:neocomplete#enable_ignore_case              = 1
"et g:neocomplete#enable_smart_case               = 1
"et g:neocomplete#enable_camel_case               = 1
"et g:neocomplete#use_vimproc                     = 1
"et g:neocomplete#sources#buffer#cache_limit_size = 1000000
"et g:neocomplete#sources#tags#cache_limit_size   = 30000000
"et g:neocomplete#enable_fuzzy_completion         = 1
"et g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
" Disable AutoComplPop.
"et g:acp_enableAtStartup = 0
" Use neocomplcache.
"et g:neocomplcache_enable_at_startup = 1
" Use smartcase.
"et g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
"et g:neocomplcache_min_syntax_length = 3
"et g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
" Define dictionary.
"et g:neocomplcache_dictionary_filetype_lists = {
"   \ 'default' : ''
"   \ }
"
" Plugin key-mappings.
"noremap <expr><C-g>     neocomplcache#undo_completion()
"noremap <expr><C-l>     neocomplcache#complete_common_string()
"
" Recommended key-mappings.
" <CR>: close popup and save indent.
"noremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"unction! s:my_cr_function()
" return neocomplcache#smart_close_popup() . "\<CR>"
"ndfunction
" <TAB>: completion.
"noremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"noremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"noremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"noremap <expr><C-y>  neocomplcache#close_popup()
"noremap <expr><C-e>  neocomplcache#cancel_popup()

""""""""""""""""""""C言語の構文解析の設定neocompleteと同時に使うやつ
" 非同期ではなくて同期処理で補完する
let g:marching_backend = "sync_clang_command"

" オプションの設定
" これは clang のコマンドに渡される
let g:marching_clang_command_option="-std=c++1y"


" neocomplete.vim と併用して使用する場合
" neocomplete.vim を使用すれば自動補完になる
let g:marching_enable_neocomplete = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp =
    \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

""""""""""""""""""""end


"---------20140727 end

"  for markdown "
" Previm
let g:previm_open_cmd = ''
nnoremap [previm] <Nop>
nmap <Space>p [previm]
nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
nnoremap <silent> [previm]r :call previm#refresh()<CR>

"---------------itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! MyFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
"-------------------------------------
"---------20140727 Z----------------------
"Unit.vim
"-----------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-B> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" yankround.vim {{{
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <silent><SID>(ctrlp) :<C-u>CtrlP<CR>
nmap <expr><C-p> yankround#is_active() ? "\<Plug>(yankround-prev)" : "<SID>(ctrlp)"
nmap <expr><C-n> yankround#is_active() ? "\<Plug>(yankround-next)" : ":Unite -buffer-name=file file<CR>"
let g:yankround_max_history = 100
nnoremap <Leader><C-p> :<C-u>Unite yankround<CR>
"}}}

" カーソル位置の単語をgrep検索
"nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> ,cg :Pt <CR> -go
nnoremap <silent> ,ccg :Ack <CR> -go
"nnoremap <silent> ,ccg :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" unite grep に ag(The Silver Searcher)(ackに変更)(さらにptに変更） を使う
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
endif

"unit outlineの設定
nnoremap <silent> ,o :<C-u>Unite -vertical -no-quit outline<CR>
let g:unite_split_rule = "rightbelow"

"ショートカットの設定
nnoremap <silent> ,n :<C-u>NERDTree<CR>
nnoremap <silent> ,t :<C-u>tabnew<CR>
nnoremap <silent> ,e8 :<C-u>e ++enc=utf-8<CR>

noremap j gj
noremap k gk
noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $
noremap <silent> ,m  %
nnoremap <Space>v  :vs<CR>:<C-u>VimShell<CR>

"vim-quickhl設定
" <Space>m でカーソル下の単語、もしくは選択した範囲のハイライトを行う
" 再度 <Space>m を行うとカーソル下のハイライトを解除する
" これは複数の単語のハイライトを行う事もできる
" <Space>M で全てのハイライトを解除する
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)


" qfixappにruntimepathを通す(パスは環境に合わせてください)

" キーマップリーダー
let QFixHowm_Key = 'g'

" howm_dirはファイルを保存したいディレクトリを設定
let howm_dir             = 'D:\howm'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.md'
let howm_fileencoding    = 'cp932'
let howm_fileformat      = 'dos'

" QuickFixウィンドウでもプレビューや絞り込みを有効化
let QFixWin_EnableMode = 1
" プレビューを有効にする
let QFix_PreviewEnable = 1
" QFixHowmのファイルタイプ
let QFixHowm_FileType = 'markdown'
" タイトル記号を # に変更する
let QFixHowm_Title = '#'
" QFixHowm/QFixGrepの結果表示にロケーションリストを使用する/しない
let QFix_UseLocationList = 0
"""""""""20140727 end
"font設定
" Windows
"set guifont=Font\ Family:h10
"set guifontwide=Font\ Family:h10
"フォントの設定
set guifont=Migu_1P:h10
"文字コード
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif
""文字コードend

"python jedi設定
" 2013-07-03 14:30 書き方を思いっきり間違えていたので修正
"NeoBundleLazy "davidhalter/jedi-vim", {
"      \ "autoload": {
"      \   "filetypes": ["python", "python3", "djangohtml"],
"      \   "build": {
"      \     "mac": "pip install jedi",
"      \     "unix": "pip install jedi",
"      \   }
"      \ }}
NeoBundleLazy "davidhalter/jedi-vim", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"],
      \ },
      \ "build": {
      \   "mac": "pip install jedi",
      \   "unix": "pip install jedi",
      \ }}
let s:hooks = neobundle#get_hooks("jedi-vim")
function! s:hooks.on_source(bundle)
  " jediにvimの設定を任せると'completeopt+=preview'するので
  " 自動設定機能をOFFにし手動で設定を行う
  let g:jedi#auto_vim_configuration = 0
  " 補完の最初の項目が選択された状態だと使いにくいためオフにする
  let g:jedi#popup_select_first = 0
  " quickrunと被るため大文字に変更
  let g:jedi#rename_command = '<Leader>R'
  " gundoと被るため大文字に変更 (2013-06-24 10:00 追記）
  let g:jedi#goto_command = '<Leader>G'
endfunction

"""""""""""""""""""""""""""""
"カラースキーマ
""""""""""""""""""""""""""""
"colorscheme hybrid
syntax on
filetype plugin indent on
"set background=light
"set background=light
colorscheme solarized
map <F11>  :sp tags<CR>:%s/^\([^     :]*:\)\=\([^    ]*\).*/syntax keyword Tag \2/<CR>:wq! tags.vim<CR>/^<CR><F12>
map <F12>  :so tags.vim<CR>
""""""""""""""end

"""""""""""""""""""""""""""""
"インデント可視化
""""""""""""""""""""""""""""
" vim-indent-guides
" Vim 起動時 vim-indent-guides を自動起動
"let g:indent_guides_enable_on_vim_startup=1
"" ガイドをスタートするインデントの量
"let g:indent_guides_start_level=2
"" 自動カラー無効
"let g:indent_guides_auto_colors=0
"" 奇数番目のインデントの色
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black
"" 偶数番目のインデントの色
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
"" ガイドの幅
"let g:indent_guides_guide_size = 1
