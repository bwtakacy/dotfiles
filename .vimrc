" Plugin設定
" vundle.vimを使う
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" golang用
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/

" Markdown用
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" 一般用
Plugin 'bronson/vim-trailing-whitespace'
"Plugin 'Yggdroot/indentLine'

call vundle#end()

" [Backspace] で既存の文字を削除できるように設定
"  start - 既存の文字を削除できるように設定
"  eol - 行頭で[Backspace]を使用した場合上の行と連結
"  indent - オートインデントモードでインデントを削除できるように設定
set backspace=start,eol,indent

" 特定のキーに行頭および行末の回りこみ移動を許可する設定
"  b - [Backspace]  ノーマルモード ビジュアルモード
"  s - [Space]      ノーマルモード ビジュアルモード
"  < - [←]          ノーマルモード ビジュアルモード
"  > - [→]          ノーマルモード ビジュアルモード
"  [ - [←]          挿入モード 置換モード
"  ] - [→]          挿入モード 置換モード
"  ~ - ~            ノーマルモード
set whichwrap=b,s,[,],<,>,~

" インクリメンタル検索を有効化
set incsearch

" 検索ヒットをハイライト
set hlsearch

" 補完時の一覧表示機能有効化
set wildmenu wildmode=list:full

" シンタックスハイライト有効化
syntax enable
highlight Normal ctermbg=black ctermfg=grey
highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray
"highlight Normal ctermbg=none ctermfg=black
"highlight StatusLine term=none cterm=none ctermfg=grey ctermbg=black
"highlight CursorLine term=none cterm=none ctermfg=darkgray ctermbg=none
"set cursorline  " カーソルラインの強調表示を有効化

" 行番号を表示
set number

" TABインデント幅を4に
set tabstop=4

" 自動インデント
set autoindent
set expandtab
set shiftwidth=4

" ステータスラインを表示
set laststatus=2 " ステータスラインを常に表示
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] " ステータスラ インの内容

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

"Vimの「%」を拡張する
source $VIMRUNTIME/macros/matchit.vim

"検索時に大文字を含んでいたら大/小を区別
set smartcase

"タブ文字、行末など不可視文字を表示する
"set list

"新しいウィンドウを下に開く
set splitbelow

"新しいウィンドウを右に開く
set splitright

"入力モード時、ステータスラインのカラーを変更
let g:hi_insert = 'hi StatusLine gui=None guifg=Black guibg=Yellow cterm=None ctermfg=Black ctermbg=Yellow'

"ハイライトをEsc2回で消去
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"拡張子に合わせていい感じに
filetype on
filetype indent on
filetype plugin on

" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

"GNU GLOBAL
map <C-g> :Gtags
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-k> :Gtags -r %<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
map <C-m> :cclose<CR>

" スペルチェック
"set spell
"hi clear SpellBad
"hi SpellBad cterm=underline,bold
"set spelllang+=cjk

if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif
