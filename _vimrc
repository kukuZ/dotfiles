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

" �s�������\��
set cursorline

" ��������\��
"set cursorcolumn



"quickfix�̐ݒ�
function QfMakeConv()
    let qflist = getqflist()
    for i in qflist
        let i.text = iconv(i.text, "cp936", "utf-8")
    endfor
    call setqflist(qflist)
endfunction

au QuickfixCmdPost make call QfMakeConv()

"undo�t�@�C���̐ݒ�
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
"�t�@�C���I�[�v��
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'Shougo/unite-outline'
"�t�@�C������
NeoBundle 'Shougo/vimfiler'
"NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
"�J���[�X�L�[�}
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'altercation/vim-colors-solarized'
"pytho�⊮�Ƃ�
NeoBundle 'davidhalter/jedi-vim'
"tree
NeoBundle 'scrooloose/nerdtree'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'
"�V���^�b�N�X
NeoBundle "slim-template/vim-slim"
"�V���^�b�N�X�n�C���C�g�Fifdef
NeoBundle 'vim-scripts/ifdef-highlighting'
"grep�̑������
NeoBundle 'rking/ag.vim'

"grep�̑������
NeoBundle 'mileszs/ack.vim'
NeoBundle 'nazo/pt.vim'

"�n�C���C�g
NeoBundle "t9md/vim-quickhl"
NeoBundle 'vim-jp/cpp-vim', {
            \ 'autoload' : {'filetypes' : 'c'}
            \ }
"NeoBundle "xolox/vim-shell"
"NeoBundle "xolox/vim-misc"
"NeoBundle "vim-scripts/ctags.vim"
"NeoBundle "xolox/vim-easytags"
"�Ȃ񂩕K�v�Ȃ��
NeoBundle 'Shougo/neosnippet-snippets'

"�����p
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'fuenor/qfixhowm'

"�X�e�[�^�X���C���C��
NeoBundle 'itchyny/lightline.vim'

"�^�u�y�[�W���̃f�B���N�g���ݒ�
NeoBundle 'kana/vim-tabpagecd'
"�o�[�W�����Ǘ�
NeoBundle 'vcscommand.vim'
"�u����
NeoBundle 'thinca/vim-qfreplace'
"�R�}���h���ʂ�ʃt�@�C���ɏo��
NeoBundle 'tyru/capture.vim'
"�~�j�}�b�v
NeoBundle 'koron/minimap-vim'
""Git�n
NeoBundle 'cohama/agit.vim'
NeoBundle 'tpope/vim-fugitive.git'
"yank�n
NeoBundle 'LeafCage/yankround.vim'
"�J�b�R����	
NeoBundle 'Townk/vim-autoclose'
"HTML�̂��
NeoBundle 'mattn/emmet-vim'
"ctrP
NeoBundle 'kien/ctrlp.vim'
"html css js sass�n�̃c�[��
NeoBundle 'mattn/emmet-vim'
NeoBundle 'surround.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'mattn/webapi-vim'
"NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
"NeoBundle 'taichouchou2/html5.vim'
"NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'

"Markdown�n�̂��߂̃c�[��
NeoBundle 'tpope/vim-markdown'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kannokanno/previm'

"C����̍\����́Fneocomplete�ƕ��p�ł���
NeoBundle "osyo-manga/vim-marching"

"�C���f���g����
NeoBundle "nathanaelkane/vim-indent-guides"
" Installation check.
NeoBundleCheck

call neobundle#end()
filetype on
filetype plugin indent on

" �⊮��L���ɂ���
let g:neocomplete#enable_at_startup = 1

" �⊮�Ɏ��Ԃ��������Ă��X�L�b�v���Ȃ�
let g:neocomplete#skip_auto_completion_time = ""
"inoremap <expr><CR>   pumvisible() ? "\<C-n>" . neocomplete#close_popup()  : "<CR>"
inoremap <expr><CR>   pumvisible() ? neocomplete#close_popup()  : "<CR>"
" neocomplcache
"let g:neocomplcache_enable_at_startup = 1 " �N�����ɗL����
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

""""""""""""""""""""C����̍\����͂̐ݒ�neocomplete�Ɠ����Ɏg�����
" �񓯊��ł͂Ȃ��ē��������ŕ⊮����
let g:marching_backend = "sync_clang_command"

" �I�v�V�����̐ݒ�
" ����� clang �̃R�}���h�ɓn�����
let g:marching_clang_command_option="-std=c++1y"


" neocomplete.vim �ƕ��p���Ďg�p����ꍇ
" neocomplete.vim ���g�p����Ύ����⊮�ɂȂ�
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
" ���̓��[�h�ŊJ�n����
let g:unite_enable_start_insert=1
" �o�b�t�@�ꗗ
noremap <C-B> :Unite buffer<CR>
" �t�@�C���ꗗ
noremap <C-N> :Unite -buffer-name=file file<CR>
" �ŋߎg�����t�@�C���̈ꗗ
noremap <C-Z> :Unite file_mru<CR>
" sources���u���J���Ă���t�@�C���̃f�B���N�g���v�Ƃ���
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" �E�B���h�E�𕪊����ĊJ��
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" �E�B���h�E���c�ɕ������ĊJ��
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESC�L�[��2�񉟂��ƏI������
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

" �J�[�\���ʒu�̒P���grep����
"nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> ,cg :Pt <CR> -go
nnoremap <silent> ,ccg :Ack <CR> -go
"nnoremap <silent> ,ccg :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" unite grep �� ag(The Silver Searcher)(ack�ɕύX)(�����pt�ɕύX�j ���g��
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
endif

"unit outline�̐ݒ�
nnoremap <silent> ,o :<C-u>Unite -vertical -no-quit outline<CR>
let g:unite_split_rule = "rightbelow"

"�V���[�g�J�b�g�̐ݒ�
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

"vim-quickhl�ݒ�
" <Space>m �ŃJ�[�\�����̒P��A�������͑I�������͈͂̃n�C���C�g���s��
" �ēx <Space>m ���s���ƃJ�[�\�����̃n�C���C�g����������
" ����͕����̒P��̃n�C���C�g���s�������ł���
" <Space>M �őS�Ẵn�C���C�g����������
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)


" qfixapp��runtimepath��ʂ�(�p�X�͊��ɍ��킹�Ă�������)

" �L�[�}�b�v���[�_�[
let QFixHowm_Key = 'g'

" howm_dir�̓t�@�C����ۑ��������f�B���N�g����ݒ�
let howm_dir             = 'D:\howm'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.md'
let howm_fileencoding    = 'cp932'
let howm_fileformat      = 'dos'

" QuickFix�E�B���h�E�ł��v���r���[��i�荞�݂�L����
let QFixWin_EnableMode = 1
" �v���r���[��L���ɂ���
let QFix_PreviewEnable = 1
" QFixHowm�̃t�@�C���^�C�v
let QFixHowm_FileType = 'markdown'
" �^�C�g���L���� # �ɕύX����
let QFixHowm_Title = '#'
" QFixHowm/QFixGrep�̌��ʕ\���Ƀ��P�[�V�������X�g���g�p����/���Ȃ�
let QFix_UseLocationList = 0
"""""""""20140727 end
"font�ݒ�
" Windows
"set guifont=Font\ Family:h10
"set guifontwide=Font\ Family:h10
"�t�H���g�̐ݒ�
set guifont=Migu_1P:h10
"�����R�[�h
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconv��eucJP-ms�ɑΉ����Ă��邩���`�F�b�N
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconv��JISX0213�ɑΉ����Ă��邩���`�F�b�N
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodings���\�z
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
  " �萔������
  unlet s:enc_euc
  unlet s:enc_jis
endif
" ���{����܂܂Ȃ��ꍇ�� fileencoding �� encoding ���g���悤�ɂ���
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" ���s�R�[�h�̎����F��
set fileformats=unix,dos,mac
" ���Ƃ����̕����������Ă��J�[�\���ʒu������Ȃ��悤�ɂ���
if exists('&ambiwidth')
  set ambiwidth=double
endif
""�����R�[�hend

"python jedi�ݒ�
" 2013-07-03 14:30 ���������v��������ԈႦ�Ă����̂ŏC��
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
  " jedi��vim�̐ݒ��C�����'completeopt+=preview'����̂�
  " �����ݒ�@�\��OFF�ɂ��蓮�Őݒ���s��
  let g:jedi#auto_vim_configuration = 0
  " �⊮�̍ŏ��̍��ڂ��I�����ꂽ��Ԃ��Ǝg���ɂ������߃I�t�ɂ���
  let g:jedi#popup_select_first = 0
  " quickrun�Ɣ�邽�ߑ啶���ɕύX
  let g:jedi#rename_command = '<Leader>R'
  " gundo�Ɣ�邽�ߑ啶���ɕύX (2013-06-24 10:00 �ǋL�j
  let g:jedi#goto_command = '<Leader>G'
endfunction

"""""""""""""""""""""""""""""
"�J���[�X�L�[�}
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
"�C���f���g����
""""""""""""""""""""""""""""
" vim-indent-guides
" Vim �N���� vim-indent-guides �������N��
"let g:indent_guides_enable_on_vim_startup=1
"" �K�C�h���X�^�[�g����C���f���g�̗�
"let g:indent_guides_start_level=2
"" �����J���[����
"let g:indent_guides_auto_colors=0
"" ��Ԗڂ̃C���f���g�̐F
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black
"" �����Ԗڂ̃C���f���g�̐F
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
"" �K�C�h�̕�
"let g:indent_guides_guide_size = 1
