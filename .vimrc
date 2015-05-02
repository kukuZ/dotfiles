" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78


  "tag
  :set tags=./tags,./TAGS,tags,TAGS

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


"20140726 Z 
filetype plugin indent on

syntax on

set nowrap
set nobackup
set hlsearch
set ignorecase

set autoindent

set ruler
set number
set list
set wildmenu
set showcmd

set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=4
set smarttab

if has("mac")
  set clipboard+=unnamed
else
  set clipboard=unnamedplus,autoselect
end
"set guifont=Monospace\ 12
set guifont=Ricty\ 12
"--------20140726 end

"-------jedi-vim for pyenv 20140815-----

" ~/.pyenv/shimsを$PATHに追加
" jedi-vim や vim-pyenc のロードよりも先に行う必要がある、はず。
let $PATH = "~/.pyenv/shims:".$PATH

"--------20140815 end
"
"

"--------20140727 Z-----------------------
"NeoBundle
"-----------------------------------------
set nocompatible               " be iMproved
filetype off


if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
"ファイルオープン
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
"ファイル操作
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
"カラースキーマ
NeoBundle 'w0ng/vim-hybrid'
" DJANGO_SETTINGS_MODULE を自動設定
NeoBundleLazy "lambdalisue/vim-django-support", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}
"pytho補完とか
NeoBundle 'davidhalter/jedi-vim'
" pyenv 処理用に vim-pyenv を追加
" Note: depends が指定されているため jedi-vim より後にロードされる（ことを期待）
NeoBundleLazy "lambdalisue/vim-pyenv", {
      \ "depends": ['davidhalter/jedi-vim'],
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}
"tree
NeoBundle 'scrooloose/nerdtree'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'
"ag grep
NeoBundle 'rking/ag.vim'
NeoBundle 't9md/vim-quickhl'
"memo系
NeoBundle 'fuenor/qfixhowm'
"タブごとにディレクトリを設定
NeoBundle 'kana/vim-tabpagecd'
"ステータスライン修飾
NeoBundle 'itchyny/lightline.vim'
"Git系
NeoBundle 'cohama/agit.vim'
NeoBundle 'tpope/vim-fugitive.git'
"Ubuntu用のEscでの入力切替
NeoBundle 'fuenor/im_control.vim'

call neobundle#end()
" qfixappにruntimepathを通す(パスは環境に合わせてください)
set runtimepath+=~/path/to/qfixapp
""""""""""""""""""""日本語固定モード設定
"日本語入力固定モード
set statusline+=%{IMStatus('[JPANESE]')}
" 「日本語入力固定モード」の動作モード
let IM_CtrlMode = 1
" 「日本語入力固定モード」切替キー
inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>

" IBus 1.5以降
function! IMCtrl(cmd)
  let cmd = a:cmd
  if cmd == 'On'
    let res = system('ibus engine "mozc-jp"')
  elseif cmd == 'Off'
    let res = system('ibus engine "xkb:jp::jpn"')
  endif
  return ''
endfunction

" <ESC>押下後のIM切替開始までの反応が遅い場合はttimeoutlenを短く設定してみてください。
" IMCtrl()のsystem()コマンド実行時に&を付けて非同期で実行するという方法でも体感速度が上がる場合があります。
set timeout timeoutlen=3000 ttimeoutlen=100 
""""""""""""""""""""""""
" キーマップリーダー
let QFixHowm_Key = 'g'

" howm_dirはファイルを保存したいディレクトリを設定
let howm_dir             = '~/howm'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.mod'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'
" ファイルタイプをmarkdownにする
let QFixHowm_FileType = 'markdown'
" タイトル行検索正規表現の辞書を初期化
let QFixMRU_Title = {}
" MRUでタイトル行とみなす正規表現(Vimの正規表現で指定)
let QFixMRU_Title['mkd'] = '^###[^#]'
" grepでタイトル行とみなす正規表現(使用するgrepによっては変更する必要があります)
let QFixMRU_Title['mkd_regxp'] = '^###[^#]'
let QFixWin_EnableMode = 1
let QFix_UseLocationList = 1
" カーソル位置の単語をgrep検索
"nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> ,cg :<C-u>Ag <CR><C-R><C-W>
" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
filetype plugin indent on     " required!
filetype indent on
syntax on

"----------lightline設定----------
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ], ['imstatus'] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \   'ctrlpmark': 'CtrlPMark',
      \   'imstatus': 'MyIMStatus',
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
function! MyIMStatus()
  return IMStatus('[INP-JPN]')
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
"---------------------------------

"---------20140727 end
"---------20140727 Z----------------------
"Unit.vim
"-----------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
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
"""""""""20140727 end

"""""""""""""""""""""""""""""
"カラースキーマ
""""""""""""""""""""""""""""
colorscheme hybrid
""""""""""""""end

""""""""""""""""""""""""""""""
"neocomplcache
"""""""""""""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
"""""""""""""""""end
" -------------------------------------------------------------------
" vim-quickhl関連 {{{
"
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
"}}}

""""""""""""""""""""""""
"jedy-vim
"""""""""""""""""""""""""
if g:jedi#popup_on_dot
  inoremap <buffer> . .<C-R>=jedi#do_popup_on_dot() ? "\<lt>C-X>\<lt>C-O>\<lt>C-P>" : ""<CR>
end
""""""""""""""end

""""""""""mac
if has("mac")
  nnoremap ; :
  nnoremap : ;
end
