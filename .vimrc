" =============================================================================
" ----------------------------------  Author: DKing
" ----------------------------------  Email: jun91367@gmail.com
" ----------------------------------  Date: 2012-12-05
" =============================================================================

colorscheme vividchalk              " vim配色主题
set encoding=utf-8                  " 设置编码
set t_Co=256                        " 颜色设定
set tabstop=4                       " 设置tab键的宽度
set shiftwidth=4                    " 换行时行间交错使用4个空格
set autoindent                      " 自动对齐
set backspace=2                     " 设置退格键可用
set cindent shiftwidth=2            " 自动缩进4空格
set smartindent                     " 智能自动缩进
set ai!                             " 设置自动缩进
set nu!                             " 显示行号
set mouse=a                         " 启用鼠标
set ruler                           " 右下角显示光标位置的状态行
set hlsearch                        " 开启高亮显示结果
set incsearch                       " 开启实时搜索功能
set nowrapscan                      " 搜索到文件两端时不重新搜索
set nocompatible                    " 关闭兼容模式
set vb t_vb=                        " 关闭提示音
set hidden                          " 允许在有未保存的修改时切换缓冲区
set autochdir                       " 设定文件浏览器目录为当前目录
set list                            " 显示Tab符，使用一高亮竖线代替
set listchars=tab:\|\ ,
set novisualbell                    " 不要闪烁
set nowritebackup                   " 无备份文件
set nobackup
set foldmethod=manual               " 默认情况下手动折叠
set iskeyword+=_,$,@,%,#,-          " 带有如下符号的单词不要被换行分割
set formatoptions+=mM               " 正确地处理中文字符的折行和拼接
set showmatch                       " 输入括号时光标短暂跳至相匹配的括号处
set wildmenu                        " 列出匹配项目
set ignorecase                      " vim忽略大小写

syntax enable                       " 打开语法高亮
syntax on                           " 开启文件类型侦测

execute pathogen#infect()
filetype indent on                  " 针对不同的文件类型采用不同的缩进格式
filetype plugin on                  " 针对不同的文件类型加载对应的插件
filetype plugin indent on           " 启用自动补全

autocmd BufWritePre * :%s/\s\+$//e  " 避免行尾空白符


" ----------------------------------- powerline -------------------------------
set laststatus=2                    " Always show the statusline

" ----------------------------------- Shortcuts -------------------------------
nmap <F2> :NERDTreeToggle<CR>
nmap <F5> gg=G <CR>

nmap ,v "+p
vmap ,c "+yy
nmap ,c "+yy
" ----------------------------------- NERDTree --------------------------------
let NERDChristmasTree=1
let NERDTreeWinSize=31

" ----------------------------------- CtrlP -----------------------------------
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git)$',
  \ 'file': '\v\.(log|jpg|png|jpeg)$',
  \ }

" ----------------------------------- Ctags -----------------------------------
set tags=/home/dking/works/tags
set tags=/home/dking/.rvm/tags

" ----------------------------------- Others ----------------------------------
" highlighting a specified column.
if exists('+colorcolumn')
  set colorcolumn=80
else
  " Emulate
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v.\+', -1)
endif

"dictionary
"set dictionary+=~/.vim/dict/mywords
"set dictionary+=/usr/share/dict/words

" 引号 && 括号自动匹配
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
:inoremap ` ``<ESC>i

function ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
	return "\<Right>"
  else
	return a:char
  endif
endf
