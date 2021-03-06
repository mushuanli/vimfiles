set nocompatible

let s:is_windows = (has("win32") || has("win64"))
let s:is_gui = has("gui_running")

if s:is_windows
  source $VIMRUNTIME/vimrc_example.vim
  source $VIMRUNTIME/mswin.vim
  behave mswin
endif

behave xterm

" SYNTAX HIGHLIGHTING... on if terminal has colors
if &t_Co > 2 || s:is_gui
    syntax on
endif



"_________________________________________________________________________
" GENERAL SETTINGS
"
if s:is_gui
if s:is_windows
map <silent> <F1>    :WMToggle<cr>
else
map <silent> <F1>    :NERDTreeToggle<cr>
endif
map <silent> <F2>    :TagbarToggle<cr>
map <silent> <F3>    zO
map <silent> <F4>    zc
map <silent> <F5>    zR
map <silent> <F6>    zM
map <silent> <F7>    :cn<CR>
else
map <silent> <leader>1   :WMToggle<cr>
map <silent> <leader>2   :TagbarToggle<cr>
map <silent> <leader>3   zO<cr>
map <silent> <leader>4   zc<cr>
map <silent> <leader>5   zR<cr>
map <silent> <leader>6   zM<cr>
map <silent> <leader>7   :cn<cr>

"   配置git的merge
"   git config --global merge.tool vimdiff
"   git config --global mergetool.prompt false
"map <silent> <leader>1 :diffget 1<CR> :diffupdate<CR>
"map <silent> <leader>2 :diffget 2<CR> :diffupdate<CR>
"map <silent> <leader>3 :diffget 3<CR> :diffupdate<CR>
"map <silent> <leader>4 :diffget 4<CR> :diffupdate<CR>

endif

"map <F12>   :NERDTreeToggle<CR>
nmap <silent> <C-S-tab> :tabprevious<CR>
nmap <silent> <C-tab>   :tabnext<CR>
map  <silent> <C-S-tab> :tabprevious<CR>
map  <silent> <C-tab>   :tabnext<CR>
imap <silent> <C-S-tab> <ESC>:tabprevious<CR>i
imap <silent> <C-tab>   <ESC>:tabnext<CR>i

"nmap   <silent> <S-Right>  :bnext<CR>
" Make <space> in normal mode go down a page rather than left a
" character
noremap <space> <C-f>

"<Leader>c进行搜索，同时不自动打开第一个匹配的文件"
map <Leader>c :Ack!<Space> 

nmap <s-down>   <c-w>w
nmap <s-up>     <c-w>W
nmap <s-left>   <c-w>h
nmap <s-right>  <c-w>l

iab #i #include
iab #d #define
iab #e #endif

set ffs=unix,dos
set fencs=cp936,ucs-bom,default,latin1,utf-8    ",ucs-bom
set langmenu=none	" 使用英文菜单
set tw=0
"set selection=exclusive

set autoindent          " copy indent from the current line when starting a new line
set nosmartindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case

set backspace=2         " allow backspacing over everything in insert mode
set history=50          " keep 50 lines of command line history

set ignorecase          " search commands are case-insensitive
set incsearch           " while typing a search command, show matches incrementally
                        " instead of waiting for you to press enter
set scs		        " 查找时智能大小写
set hlsearch	        " hlsearch, 高亮显示查找结果

"set mouse=a             " enable mouse interaction
set mousehide		" Hide the mouse when typing text
set number              " line numbers at the side
set ruler               " show the cursor position all the time
set shiftwidth=4        " pressing >> or << in normal mode indents by 4 characters
set tabstop=8           " a tab character indents to the 4th (or 8th, 12th, etc.) column
set sts=4	    " soft tab是4空格, 按一次tab时也是4格, 使用space代替
set shiftround
set expandtab 
set smarttab 

set viminfo='20,\"50    " read/write a .viminfo file, don't store more than 50 lines of registers
set encoding=utf8       " non-ascii characters are encoded with UTF-8 by default

"set formatoptions=croq  " c=autowrap comments, r=continue comment on <enter>,
                        " o=continue comment on o or O, q=allow format comment with gqgq
set formatoptions=tcrqn2mB
set whichwrap+=<,>,[,]

set textwidth=0         " no forced wrapping in any file type (unless overridden)
set showcmd             " show length of visual selection (docs recommended
                        " keeping this off when working over slow connections)
" Speed up macros
set lazyredraw

set complete=.,w,b,u    " make autocomplete faster - http://www.mail-archive.com/vim@vim.org/msg03963.html
set splitright          " create vertical splits to the right
set splitbelow          " create horizontal splits below

" Filename completion
set wildmode=longest:full,full
set wildmenu
set wildignore+=*.svn,*.svn-base,*.bak,*.sw?,*.zip,*.so,*.e,*.pyc,*.pyo,*~
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifestg,*.d
set suffixes=.svn


" Allow edit buffers to be hidden
set hidden


set autoread              " read open files again when changed outside Vim
set autowrite             " write a modified buffer on each shell
set browsedir=current     " which directory to use for the file browser


set ch=2		" Make command line two lines high
let c_comment_strings=1	" I like highlighting strings inside C comments
set lsp=0	    " space it out a little more (easier to read)
set vb t_vb=	    " set visual bell and disable screen flash

set grepprg=grep\ -nH	"   使用grep查找, grep包括在unxutils中

if exists(":tabedit")   " if this version of vim supports tabs...
    set switchbuf=usetab " when switching buffers, include tabs
    set tabpagemax=30   " show up to 30 tabs
endif

if version >= 703       " if version 7.3+ of Vim...
    set stal=1          " 当打开多个tab时显示tab,如果只有一个则不显示,tab只在7.0中有效
    set cryptmethod=blowfish " use blowfish encryption for encrytped files
endif

"_________________________________________________________________________
" WINDOWS-SPECIFIC
"

" load some scripts that are packaged with the Windows version of Vim.
set backup    " enable backup and define the backup file
set backupext=.bak


if s:is_windows
    "set nobackup
    set dir=D:\\tmp\\vim\\swap
    set backupdir=D:\tmp\vim\bak
    set undodir=D:\\tmp\\vim\\swap

    let s:vimrc_path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
    let $PATH = $PATH . ";" . s:vimrc_path . '\bin'

else
    set dir=/tmp
    set backupdir=/tmp
    set undodir=/tmp

    if exists('$TMUX')
        set term=screen-256color
    else
        set term=screen
    endif
endif


"_________________________________________________________________________
" GUI OPTIONS - only affects gvim
"
set guicursor=a:blinkon0    "   停止闪烁
if s:is_gui
    au GUIEnter * simalt ~x     " Start maximized
    set guioptions-=T           " No toolbar
    set guioptions-=m           " No menus
    set guioptions-=L           " No left scrollbar
    set guioptions-=r           " No right scrollbar

    if v:version >= 700
        set cursorline		" 高亮当前行,在oceandeep布局下显示的不是很清楚，
        set cursorcolumn
    endif

    if s:is_windows
        set renderoptions=type:directx,renmode:5,taamode:1
        set guifont=Fixedsys:h12:cGB2312,DejaVu_Sans_Mono:h11,Inconsolata:h11,Consolas:h11
    else
        set guifont=Bitstream\ Vera\ Sans\ Mono\ 16
    endif   

    colorscheme  darkblue "molokai    oceandeep   
else
    set t_Co=256
    colors darkblue "molokai 
endif

"-------------------------------------------------------------------------------
" Change the working directory to the directory containing the current file
"-------------------------------------------------------------------------------
if has("autocmd")
    " 如果使用cscope或是ctags的话, 最好不要自动切换目录, 不然标志无法定位
    "  autocmd BufEnter * :lcd %:p:h
endif




"""""""""""""""""""""""""""""""""""""""
"   大文件配置
"""""""""""""""""""""""""""""""""""""""
" file is large from 10mb
let g:LargeFile = 1024 * 1024 * 10
augroup LargeFile 
 autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
 " no syntax highlighting etc
 set eventignore+=FileType
 " save memory when other file is viewed
 setlocal bufhidden=unload
 " is read-only (write with :w new_filename)
 setlocal buftype=nowrite
 " no undo possible
 setlocal undolevels=-1
 " display message
 autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction

"""""""""""""""""""""""""""""""""""""""
"   折行配置
"""""""""""""""""""""""""""""""""""""""
"   根据语法折行, 如c/c++中就是{}
set foldenable
set foldmethod=indent   " marker,folder模式为语法
autocmd FileType cpp,c setlocal foldmethod=syntax

set foldlevel=100       " Don't autofold anything (but I can still fold manually)
set foldopen-=search    " don't open folds when you search into them
set foldopen-=undo      " don't open folds when you undo stuff
"set foldopen=block,hor,mark,percent,quickfix,search,tag " what movements open folds
let g:vimsyn_folding = ''
let g:vimsyn_folding .= 'a' " augroups
let g:vimsyn_folding .= 'f' " fold functions
let g:vimsyn_folding .= 'm' " fold mzscheme script
let g:vimsyn_folding .= 'p' " fold perl     script
let g:vimsyn_folding .= 'P' " fold python   script
let g:vimsyn_folding .= 'r' " fold ruby     script
let g:vimsyn_folding .= 't' " fold tcl      script


let g:sh_fold_enabled = 0      " default, no syntax folding
let g:sh_fold_enabled += 1     " enable function folding
let g:sh_fold_enabled += 2     " enable heredoc folding
let g:sh_fold_enabled += 4     " enable if/do/for folding

" SimpylFold plugin
"let g:SimpylFold_docstring_preview = 1

let g:load_doxygen_syntax = 0 " 启用源代码中的doxygen注释高亮
let g:doxygen_enhanced_color = 0    " 对Doxygen注释使用非标准高亮

let g:is_bash	   = 1  " 如果没有#!行，缺省认为shell脚本用的是bash

"""""""""""""""""""""""""""""""""""""""
" Perl
"""""""""""""""""""""""""""""""""""""""
let perl_extended_vars=1 " highlight advanced perl vars inside strings






""""""""""""""""""""""""""""""""""""""
"   网上下载
""""""""""""""""""""""""""""""""""""""
" Nice statusbar
set laststatus=2
set statusline=
set statusline+=%2*%-10.3n%0*\                " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%1*%m%r%w%0*               " flags
"set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
"set statusline+=%{&encoding},                " encoding
"set statusline+=%{&fileformat}]              " file format
if filereadable(expand("$VIM/vimfiles/plugin/vimbuddy.vim"))
    set statusline+=\ %{VimBuddy()}          " vim buddy
endif
set statusline+=%=                           " right align
set statusline+=%2*0x%-4B\                   " current char
set statusline+=%-8.(%l,%c%V%)\ %<%P        " offset

" special statusbar for special windows
if has("autocmd")
    au FileType qf
                \ if &buftype == "quickfix" |
                \     setlocal statusline=%2*%-3.3n%0* |
                \     setlocal statusline+=\ \[Compiler\ Messages\] |
                \     setlocal statusline+=%=%2*\ %<%P |
                \ endif

endif

" Nice window title
if has('title') && (s:is_gui || &title)
    set titlestring=
    set titlestring+=%f\                     " file name
    set titlestring+=%h%m%r%w                " flags
    set titlestring+=\ -\ %{v:progname}      " program name
endif

" If possible, try to use a narrow number column.
if v:version >= 700
    try
        setlocal numberwidth=3
    catch
    endtry
endif


" Better include path
set path+=src/

" Show tabs and trailing whitespace visually
"if (&termencoding == "utf-8") || has("gui_running")
"    if v:version >= 700
"        set list listchars=tab:?·,trail:·,extends:…,nbsp:?
"    else
"        set list listchars=tab:?·,trail:·,extends:…
"    endif
"else
"    if v:version >= 700
"        set list listchars=tab:>-,trail:.,extends:>,nbsp:_
"    else
"        set list listchars=tab:>-,trail:.,extends:>
"    endif
"endif

set fillchars=fold:-

"	 "-----------------------------------------------------------------------
"	 " completion
"	 "-----------------------------------------------------------------------
"	 set dictionary=/usr/share/dict/words




"_________________________________________________________________________
" ARCANE SETTINGS AND TWEAKS
"

" xml ftplugin:  Don't automatically create new nesting level for every element.
" http://www.vim.org/scripts/script.php?script_id=301
" https://github.com/sukima/xmledit/
let xml_no_auto_nesting = 1

" When listing directories, hide temporary files or binary files.  Allow
" gzip/bzip2 though, since Vim can sometimes open those.
let g:netrw_list_hide=join(['^.\+\.pyc$',
                           \'^.\+\.pyo$',
                           \'^.\+\.jpg$',
                           \'^.\+\.png$',
                           \'^.\+\.exe$',
                           \'^.\+\.class$',
                           \'^.\+\.zip$',
                           \'^.\+\.pyo$',
                           \'^.\+\.pyc$',
                           \'^.\+\.xls[xm]\=$',
                           \'^.\+\.doc[xm]\=$',
                           \'^.\+\.ppt[xm]\=$',
                           \'^.\+\.sqlite3\=$',
                           \'^.\+\.sqlite3\=$',
                           \'^\..\+\.sw.$'],
                           \',')
let g:netrw_hide=1         " Enable hiding based on g:netrw_list_hide
let g:netrw_mouse_maps=0   " Ignore mouse clicks

" Use old-fasioned HTML with the Tohtml command, so that it can be pasted into
" emails.
let g:html_use_css = 0

" Don't show line numbers when converting to HTML.
let g:html_number_lines=0

"""""""""""""""""""""""""""""""""""""""
"   插件配置
"""""""""""""""""""""""""""""""""""""""
"   WinManager
let g:NERDTree_title='NERD Tree'  
let g:winManagerWindowLayout='NERDTree|BufExplorer'  
function! NERDTree_Start()  
    exe 'q'
    exec 'NERDTree'  
endfunction

function! NERDTree_IsValid()  
    return 1  
endfunction

let g:Tagbar_title = "[Tagbar]"
function! Tagbar_Start()
    exe 'q'
    exe 'TagbarOpen'
endfunction


function! Tagbar_IsValid()
    return 1
endfunction

let g:winManagerWidth = 25
let g:defaultExplorer = 0
autocmd BufWinEnter \[Buf\ List\] setl nonumber


"   NERD Tree
let NERDChristmasTree=0
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=0
let NERDTreeShowLineNumbers=1
let NERDTreeIgnore=['\.svn$','\.o$','\.ko$','\.cmd$','\~$','\.pyc$','\.pyo$']
let NERDTreeWinPos = "left" "where NERD tree window is placed on the screen
let NERDTreeWinSize = 31 "size of the NERD tree

" ack
"调用ag进行搜索
if executable('ag')
  let g:ackprg = 'ag --vimgrep --ignore-dir=third'
endif
"高亮搜索关键词
let g:ackhighlight = 1
"修改快速预览窗口高度为15
let g:ack_qhandler = "botright copen 15"
"在QuickFix窗口使用快捷键以后，自动关闭QuickFix窗口
let g:ack_autoclose = 1
"使用ack的空白搜索，即不添加任何参数时对光标下的单词进行搜索，默认值为1，表示开启，置0以后使用空白搜索将返回错误信息
let g:ack_use_cword_for_empty_search = 1
"部分功能受限，但对于大项目搜索速度较慢时可以尝试开启
"let g:ack_use_dispatch = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config BufExplorer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.


"-----------------------------------------------------------------------
" plugin / script / app settings
"-----------------------------------------------------------------------

if has("eval")
    " Perl specific options
    let perl_include_pod=1
    let perl_fold=1
    let perl_fold_blocks=1

    " Vim specific options
    let g:vimsyntax_noerror=1
    let g:vimembedscript=0

    " c specific options
    let g:c_gnu=1
    let g:c_no_curly_error=1

    " eruby options
    au Syntax * hi link erubyRubyDelim Directory

    " Settings for explorer.vim
    let g:explHideFiles='^\.'

    " Settings for netrw
    let g:netrw_list_hide='^\.,\~$'

    " Settings for :TOhtml
    let html_number_lines=1
    let html_use_css=1
    let use_xhtml=1

    " cscope settings
    if has('cscope') 
        " && filereadable("/usr/bin/cscope")
        """""""""""""""""""""""""""""""""""""""
        "   设置使用cscope, 并设置自动查找tags文件的目录
        """""""""""""""""""""""""""""""""""""""
        set cst
        set csto=1
        set tags=./tags,../tags,../../tags,../../../tags
        set cspc=3	    " show file path's last three part
        set csto=0
        set cscopetag
        set nocsverb
        "if filereadable("cscope.out")
        "    cs add cscope.out
        "endif
        "set csverb

        let x = "sgctefd"
        while x != ""
            let y = strpart(x, 0, 1) | let x = strpart(x, 1)
            exec "nmap <C-j>" . y . " :cscope find " . y .
                        \ " <C-R>=expand(\"\<cword\>\")<CR><CR>"
            exec "nmap <C-j><C-j>" . y . " :scscope find " . y .
                        \ " <C-R>=expand(\"\<cword\>\")<CR><CR>"
        endwhile
        nmap <C-j>i      :cscope find i ^<C-R>=expand("<cword>")<CR><CR>
        nmap <C-j><C-j>i :scscope find i ^<C-R>=expand("<cword>")<CR><CR>
    endif
endif


if s:is_windows
"   tagtoggle
" Added to ~/ctags.cnf (On Win7):
" --langdef=powershell
" --langmap=powershell:.ps1.psm1
" --regex-powershell=/^[Ff]unction[\t ]*([a-zA-Z0-9_-]+)/\1/f,function/
" --regex-powershell=/^[Ff]ilter[\t ]*([a-zA-Z0-9_-]+)/\1/i,filter/
" --regex-powershell=/^[sS]et-[Aa]lias[\t ]*([a-zA-Z0-9_-]+)/\1/a,alias/
    let g:tagbar_type_ps1 = {
                \ 'ctagstype' : 'powershell',
                \ 'kinds'     : [
                \ 'f:function',
                \ 'i:filter',
                \ 'a:alias'
                \ ]
                \ }
endif

""""""""""""""""""""""""""""""""""""""
"   ctrlp
""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

"<Leader>f搜索MRU文件
nmap <Leader>f :CtrlPMRUFiles<CR>
"<Leader>b显示缓冲区文件，并可通过序号进行跳转
nmap <Leader>b :CtrlPBuffer<CR>
"设置搜索时忽略的文件
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)\|third$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom = 1
"修改QuickFix窗口显示的最大条目数
let g:ctrlp_max_height = 15
let g:ctrlp_match_window_reversed = 0
"设置MRU最大条目数为500
let g:ctrlp_mruf_max = 500
let g:ctrlp_follow_symlinks = 1
"默认使用全路径搜索，置1后按文件名搜索，准确率会有所提高，可以用<C-d>进行切换
let g:ctrlp_by_filename = 1
"默认不使用正则表达式，置1改为默认使用正则表达式，可以用<C-r>进行切换
let g:ctrlp_regexp = 0
"自定义搜索列表的提示符
let g:ctrlp_line_prefix = '? '

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif



if s:is_windows
    set diffexpr=MyDiff()
    function MyDiff()
        let opt = '-a --binary '
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        let arg1 = v:fname_in
        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        let arg2 = v:fname_new
        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        let arg3 = v:fname_out
        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        if $VIMRUNTIME =~ ' '
            if &sh =~ '\<cmd'
                if empty(&shellxquote)
                    let l:shxq_sav = ''
                    set shellxquote&
                endif
                let cmd = '"' . $VIMRUNTIME . '\diff"'
            else
                let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
            endif
        else
            let cmd = $VIMRUNTIME . '\diff'
        endif
        silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
        if exists('l:shxq_sav')
            let &shellxquote=l:shxq_sav
        endif
    endfunction
endif

" DirDiff
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp"
let g:DirDiffIgnore = "Id:,Revision:,Date:"
let g:DirDiffIgnoreCase = 0
let g:DirDiffForceLang = "C"
let g:DirDiffWindowSize = 14

""""""""""""""""""""""""""""""""""""""""""""""""""""
"	其它不用的
""""""""""""""""""""""""""""""""""""""""""""""""""""







"	"-----------------------------------------------------------------------
"	" autocmds
"	"-----------------------------------------------------------------------
"	
"	if has("eval")
"	
"	    " If we're in a wide window, enable line numbers.
"	    fun! <SID>WindowWidth()
"	        if winwidth(0) > 90
"	            setlocal foldcolumn=1
"	            setlocal number
"	        else
"	            setlocal nonumber
"	            setlocal foldcolumn=0
"	        endif
"	    endfun
"	endif
"	
"	" content creation
"	if has("autocmd")
"	    augroup content
"	        autocmd!
"	
"	        autocmd BufNewFile *.rb 0put ='# vim: set sw=4 sts=4 et tw=80 :' |
"	                    \ 0put ='#!/usr/bin/ruby' | set sw=4 sts=4 et tw=80 |
"	                    \ norm G
"	
"	        autocmd BufNewFile *.hh 0put ='/* vim: set sw=4 sts=4 et foldmethod=syntax : */' |
"	                    \ 1put ='' | call MakeIncludeGuards() |
"	                    \ 5put ='#include \"config.h\"' |
"	                    \ set sw=4 sts=4 et tw=80 | norm G
"	
"	        autocmd BufNewFile *.cc 0put ='/* vim: set sw=4 sts=4 et foldmethod=syntax : */' |
"	                    \ 1put ='' | 2put ='' | call setline(3, '#include "' .
"	                    \ substitute(expand("%:t"), ".cc$", ".hh", "") . '"') |
"	                    \ set sw=4 sts=4 et tw=80 | norm G
"	
"	        autocmd BufNewFile configure.ac
"	                    \ 0put ='dnl vim: set sw=8 sts=8 noet :' |
"	                    \ $put ='' |
"	                    \ call setline(line('$'), 'AC_INIT([' . substitute(expand('%:p:h'),
"	                    \     '^.\{-}/\([^/]\+\)\(/trunk\)\?$', '\1', '') . '], [0.0])') |
"	                    \ $put ='AC_PREREQ(2.5)' |
"	                    \ $put ='AC_CONFIG_SRCDIR([])' |
"	                    \ $put ='AC_CONFIG_AUX_DIR(config)' |
"	                    \ $put ='AM_INIT_AUTOMAKE(1.9)' |
"	                    \ $put ='' |
"	                    \ $put ='dnl check for required programs' |
"	                    \ $put ='AC_PROG_CXX' |
"	                    \ $put ='AC_PROG_INSTALL' |
"	                    \ $put ='AC_PROG_LN_S' |
"	                    \ $put ='AC_PROG_RANLIB' |
"	                    \ $put ='AC_PROG_MAKE_SET' |
"	                    \ $put ='' |
"	                    \ $put ='dnl output' |
"	                    \ $put ='AM_CONFIG_HEADER(config.h)' |
"	                    \ $put ='AC_OUTPUT(' |
"	                    \ $put ='   Makefile' |
"	                    \ $put ='   src/Makefile' |
"	                    \ $put ='   )' |
"	                    \ set sw=8 sts=8 noet |
"	                    \ norm ggjjjjf]
"	
"	        autocmd BufNewFile autogen.bash
"	                    \ 0put ='#!/usr/bin/env bash' |
"	                    \ 1put ='# vim: set sw=4 sts=4 et tw=80 :' |
"	                    \ $put ='run() {' |
"	                    \ $put ='echo \">>> $@\"' |
"	                    \ $put ='    if ! $@ ; then' |
"	                    \ $put ='        echo \"oops!\" 1>&2' |
"	                    \ $put ='        exit 127' |
"	                    \ $put ='    fi' |
"	                    \ $put ='}' |
"	                    \ $put ='' |
"	                    \ $put ='get() {' |
"	                    \ $put ='    type ${1}-${2}    &>/dev/null && echo ${1}-${2}    && return' |
"	                    \ $put ='    type ${1}${2//.}  &>/dev/null && echo ${1}${2//.}  && return' |
"	                    \ $put ='    type ${1}         &>/dev/null && echo ${1}         && return' |
"	                    \ $put ='    echo \"Could not find ${1} ${2}\" 1>&2' |
"	                    \ $put ='    exit 127' |
"	                    \ $put ='}' |
"	                    \ $put ='' |
"	                    \ $put ='run mkdir -p config' |
"	                    \ $put ='run $(get libtoolize 1.5 ) --copy --force --automake' |
"	                    \ $put ='rm -f config.cache' |
"	                    \ $put ='run $(get aclocal 1.9 )' |
"	                    \ $put ='run $(get autoheader 2.59 )' |
"	                    \ $put ='run $(get autoconf 2.59 )' |
"	                    \ $put ='run $(get automake 1.9 ) -a --copy' |
"	                    \ set sw=4 sts=4 et tw=80 |
"	                    \ norm gg=Ggg
"	
"	        autocmd BufNewFile Makefile.am
"	                    \ 0put ='CLEANFILES = *~' |
"	                    \ if (! filereadable(expand("%:p:h:h") . '/Makefile.am')) |
"	                    \     $put ='MAINTAINERCLEANFILES = Makefile.in configure config/* aclocal.m4 \' |
"	                    \     $put ='' |
"	                    \     call setline(line('$'), "\t\t\tconfig.h config.h.in") |
"	                    \     $put ='AUTOMAKE_OPTIONS = foreign dist-bzip2' |
"	                    \     $put ='EXTRA_DIST = autogen.bash' |
"	                    \ else |
"	                    \     $put ='MAINTAINERCLEANFILES = Makefile.in' |
"	                    \ endif
"	
"	    augroup END
"	endif
"	
"	"-----------------------------------------------------------------------
"	" mappings
"	"-----------------------------------------------------------------------
"	
"	nmap   <silent> <S-Right>  :bnext<CR>
"	
"	" v_K is really really annoying
"	vmap K k
"	
"	" Delete a buffer but keep layout
"	if has("eval")
"	    command! Kwbd enew|bw #
"	    nmap     <C-w>!   :Kwbd<CR>
"	endif
"	
"	" quickfix things
"	nmap <Leader>cwc :cclose<CR>
"	nmap <Leader>cwo :botright copen 5<CR><C-w>p
"	nmap <Leader>cn  :cnext<CR>
"	
"	" Annoying default mappings
"	inoremap <S-Up>   <C-o>gk
"	inoremap <S-Down> <C-o>gj
"	noremap  <S-Up>   gk
"	noremap  <S-Down> gj
"	
"	" Make <space> in normal mode go down a page rather than left a
"	" character
"	noremap <space> <C-f>
"	
"	" Useful things from inside imode
"	inoremap <C-z>w <C-o>:w<CR>
"	inoremap <C-z>q <C-o>gq}<C-o>k<C-o>$
"	
"	" Commonly used commands
"	"nmap <silent> <F3> :silent nohlsearch<CR>
"	"imap <silent> <F3> <C-o>:silent nohlsearch<CR>
"	"nmap <F4> :Kwbd<CR>
"	"nmap <F5> <C-w>c
"	"nmap <F7> :make check<CR>
"	"nmap <F8> :make<CR>
"	"nmap <F10> :!svn update<CR>
"	"nmap <F11> :!svn status \| grep -v '^?' \| sort -k2<CR>
"	
"	" Insert a single char
"	noremap <Leader>i i<Space><Esc>r
"	
"	" Split the line
"	nmap <Leader>n \i<CR>
"	
"	" Pull the following line to the cursor position
"	noremap <Leader>J :s/\%#\(.*\)\n\(.*\)/\2\1<CR>
"	
"	" In normal mode, jj escapes
"	inoremap jj <Esc>
"	
"	" Kill line
"	noremap <C-k> "_dd
"	
"	" Select everything
"	noremap <Leader>gg ggVG
"	
"	" Reformat everything
"	noremap <Leader>gq gggqG
"	
"	" Reformat paragraph
"	noremap <Leader>gp gqap
"	
"	" Clear lines
"	noremap <Leader>clr :s/^.*$//<CR>:nohls<CR>
"	
"	" Delete blank lines
"	noremap <Leader>dbl :g/^$/d<CR>:nohls<CR>
"	
"	" Enclose each selected line with markers
"	noremap <Leader>enc :<C-w>execute
"	            \ substitute(":'<,'>s/^.*/#&#/ \| :nohls", "#", input(">"), "g")<CR>
"	
"	" Enable fancy % matching
"	if has("eval")
"	    runtime! macros/matchit.vim
"	endif
"	"	
"	"	 " q: sucks
"	"	 nmap q: :q
"	"	
"	"	 " set up some more useful digraphs
"	"	 if has("digraphs")
"	"	     digraph ., 8230    " ellipsis (…)
"	"	 endif
"	
"	if has("eval")
"	    " GNU format changelog entry
"	    fun! MakeChangeLogEntry()
"	        norm gg
"	        /^\d
"	        norm 2O
"	        norm k
"	        call setline(line("."), strftime("%Y-%m-%d") .
"	                    \ " J. Alberto Suárez López <bass@gentoo.org>")
"	        norm 2o
"	        call setline(line("."), "\t* ")
"	        norm $
"	    endfun
"	    noremap <Leader>cl :call MakeChangeLogEntry()<CR>
"	
"	    " command aliases, can't call these until after cmdalias.vim is loaded
"	    au VimEnter * if exists("loaded_cmdalias") |
"	                \       call CmdAlias("mkdir",   "!mkdir") |
"	                \       call CmdAlias("cvs",     "!cvs") |
"	                \       call CmdAlias("svn",     "!svn") |
"	                \       call CmdAlias("commit",  "!svn commit -m \"") |
"	                \       call CmdAlias("upload",  "make upload") |
"	                \ endif
"	endif
"	
"	" super i_c-y / i_c-e
"	if v:version >= 700 && has("eval")
"	    fun! SuperYank(offset)
"	        let l:cursor_pos = col(".")
"	        let l:this_line = line(".")
"	        let l:source_line = l:this_line + a:offset
"	        let l:this_line_text = getline(l:this_line)
"	        let l:source_line_text = getline(l:source_line)
"	        let l:add_text = ""
"	
"	        let l:motion = "" . nr2char(getchar())
"	        if -1 != match(l:motion, '\d')
"	            let l:count = 0
"	            while -1 != match(l:motion, '\d')
"	                let l:count = l:count * 10 + l:motion
"	                let l:motion = "" . nr2char(getchar())
"	            endwhile
"	        else
"	            let l:count = 1
"	        endif
"	
"	        if l:motion == "$"
"	            let l:add_text = strpart(l:source_line_text, l:cursor_pos - 1)
"	        elseif l:motion == "w"
"	            let l:add_text = strpart(l:source_line_text, l:cursor_pos - 1)
"	            let l:add_text = substitute(l:add_text,
"	                        \ '^\(\s*\%(\S\+\s*\)\{,' . l:count . '}\)\?.*', '\1', '')
"	        elseif l:motion == "f" || l:motion == "t"
"	            let l:add_text = strpart(l:source_line_text, l:cursor_pos - 1)
"	            let l:char = nr2char(getchar())
"	            let l:pos = matchend(l:add_text,
"	                        \ '^\%([^' . l:char . ']\{-}' . l:char . '\)\{' . l:count . '}')
"	            if -1 != l:pos
"	                let l:add_text = strpart(l:add_text, 0, l:motion == "f" ? l:pos : l:pos - 1)
"	            else
"	                let l:add_text = ''
"	            endif
"	        else
"	            echo "Unknown motion: " . l:motion
"	        endif
"	
"	        if l:add_text != ""
"	            let l:new_text = strpart(l:this_line_text, 0, l:cursor_pos - 1) .
"	                        \ l:add_text . strpart(l:this_line_text, l:cursor_pos - 1)
"	            call setline(l:this_line, l:new_text)
"	            call cursor(l:this_line, l:cursor_pos + strlen(l:add_text))
"	        endif
"	    endfun
"	
"	    inoremap <C-g>y <C-\><C-o>:call SuperYank(-1)<CR>
"	    inoremap <C-g>e <C-\><C-o>:call SuperYank(1)<CR>
"	endif
"	
"	"	 " tab completion
"	"	 if has("eval")
"	"	     function! CleverTab()
"	"	         if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
"	"	             return "\<Tab>"
"	"	         else
"	"	             return "\<C-N>"
"	"	         endif
"	"	     endfun
"	"	     inoremap <Tab> <C-R>=CleverTab()<CR>
"	"	     inoremap <S-Tab> <C-P>
"	"	 endif
"	
"	"	
"	"	     augroup abbreviations
"	"	         autocmd!
"	"	         autocmd FileType cpp :call <SID>abbrev_cpp()
"	"	     augroup END
"	"	 endif
"	
"	"-----------------------------------------------------------------------
"	" special less.sh and man modes
"	"-----------------------------------------------------------------------
"	
"	if has("eval") && has("autocmd")
"	    fun! <SID>check_pager_mode()
"	        if exists("g:loaded_less") && g:loaded_less
"	            " we're in vimpager / less.sh / man mode
"	            set laststatus=0
"	            set ruler
"	            set foldmethod=manual
"	            set foldlevel=99
"	            set nolist
"	        endif
"	    endfun
"	    autocmd VimEnter * :call <SID>check_pager_mode()
"	endif
