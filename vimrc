" Modeline and Notes  {{{
"   vim: set foldmarker={{{,}}} foldlevel=0 spell:
"
"   Plugins referenced:
"   - NERDTree
"   - TagList
"   - BufferExplorer
"   - neocomplcache
"
"  }}}

" Vundle  {{{

    filetype off
    set nocompatible " explicitly get out of vi-compatible mode

    set rtp+=~/.vim/bundle/vundle/

    set encoding=utf8 " just in case ;)
    call vundle#rc()

    " Powerline Settings  {{{
        let g:Powerline_symbols = 'fancy'
    "  }}}

    " let Vundle manage Vundle
    " required!
    Bundle "gmarik/vundle"

    " my bundles
    Bundle 'altercation/vim-colors-solarized'

    Bundle 'thisivan/vim-bufexplorer'

    Bundle 'git://git.wincent.com/command-t.git'

    Bundle 'joestelmach/javaScriptLint.vim'

    Bundle 'Shougo/neocomplcache'

    Bundle 'scrooloose/nerdtree'

    Bundle 'tpope/vim-surround'

    Bundle 'majutsushi/tagbar'

    Bundle 'digitaltoad/vim-jade'

    Bundle 'groenewege/vim-less'

    Bundle 'chrisbra/SudoEdit.vim'

    Bundle 'jiangmiao/auto-pairs'

    Bundle 'tpope/vim-fugitive'

    Bundle 'Lokaltog/vim-easymotion'

    Bundle 'tpope/vim-rails.git'

    Bundle 'L9'

    Bundle 'FuzzyFinder'

    Bundle 'kchmck/vim-coffee-script'

    Bundle 'xaviershay/tslime.vim'

    Bundle 'Lokaltog/vim-powerline'

    Bundle 'scrooloose/syntastic'

    Bundle 'YankRing.vim'
"  }}}

" Basics  {{{

    set noexrc " don't use local version of .(g)vimrc, .exrc

    set cpoptions=aABceFsmq
    "             |||||||||
    "             ||||||||+-- When joining lines, leave the cursor
    "             |||||||      between joined lines
    "             |||||||+-- When a new match is created (showmatch)
    "             ||||||      pause for .5
    "             ||||||+-- Set buffer options when entering the
    "             |||||      buffer
    "             |||||+-- :write command updates current file name
    "             ||||+-- Automatically add <CR> to the last line
    "             |||      when using :@r
    "             |||+-- Searching continues at the end of the match
    "             ||      at the cursor position
    "             ||+-- A backslash has no special meaning in mappings
    "             |+-- :write updates alternative file name
    "             +-- :read updates alternative file name

    syntax on " syntax highlighting on
"  }}}

" General  {{{
    filetype plugin indent on " load filetype plugins/indent settings

    "set autochdir " always switch to the current file directory

    set backspace=indent,eol,start " make backspace a more flexible

    set backup " make backup files
    set backupdir=~/.vim/.backup " where to put backup files
    set directory=~/.vim/.tmp " directory to place swap files in

    " Enable persistent undo history (needs vim >=7.3)
    try
        set undofile
        set undodir=~/.vim/.undo
    catch
    endtry

    "set clipboard+=unnamed " share windows clipboard

    set fileformats=unix,dos,mac " support all three, in this order
    set hidden " you can change buffers without saving

    " (XXX: #VIM/tpope warns the line below could break things)
    "set iskeyword+=_,$,@,%,# " none of these are word dividers

    set mouse=a " use mouse everywhere
    set noerrorbells " don't make noise
    set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
    "             | | | | | | | | |
    "             | | | | | | | | +-- "]" Insert and Replace
    "             | | | | | | | +-- "[" Insert and Replace
    "             | | | | | | +-- "~" Normal
    "             | | | | | +-- <Right> Normal and Visual
    "             | | | | +-- <Left> Normal and Visual
    "             | | | +-- "l" Normal and Visual (not recommended)
    "             | | +-- "h" Normal and Visual (not recommended)
    "             | +-- <Space> Normal and Visual
    "             +-- <BS> Normal and Visual

    set wildmenu " turn on command line completion wild style
    " ignore these list file extensions
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,
                    \*.jpg,*.gif,*.png
    set wildmode=list:longest " turn on wild mode huge list
"  }}}

" Vim UI  {{{
    colorscheme solarized " my favorite color scheme (only works in GUI or with 256-color terminal emulator using the solarized colorscheme)
    set cursorline " highlight current line
    set cursorcolumn " highlight the current column
    set incsearch " BUT do highlight as you type you
                   " search phrase
    set laststatus=2 " always show the status line
    set lazyredraw " do not redraw while running macros
    "set linespace=0 " don't insert any extra pixel lines
                     " betweens rows
    set list " we do what to show tabs, to ensure we get them
              " out of my files
    set listchars=tab:>-,trail:- " show tabs and trailing
    set matchtime=1 " how many tenths of a second to blink
                     " matching brackets for
    set nohlsearch " do not highlight searched for phrases
    set nostartofline " leave my cursor where it was
    set novisualbell " don't blink
    set number " turn on line numbers
    "set numberwidth=5 " We are good up to 99999 lines
    set report=0 " tell us when anything is changed via :...
    set ruler " Always show current positions along the bottom
    set scrolloff=10 " Keep 10 lines (top/bottom) for scope
    set shortmess=aOstT " shortens messages to avoid
                         " 'press a key' prompt
    set showcmd " show the command being typed
    set showmatch " show matching brackets
    set sidescrolloff=10 " Keep 5 lines at the size
    set statusline=%F%{PasteModeFlag()}%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]%=%{getcwd()}
    "              | |                 | | | |  |   |      |  |     |    |    | |
    "              | |                 | | | |  |   |      |  |     |    |    | + workdir
    "              | |                 | | | |  |   |      |  |     |    |    + separator
    "              | |                 | | | |  |   |      |  |     |    + current
    "              | |                 | | | |  |   |      |  |     |       column
    "              | |                 | | | |  |   |      |  |     +-- current line
    "              | |                 | | | |  |   |      |  +-- current % into file
    "              | |                 | | | |  |   |      +-- current syntax in
    "              | |                 | | | |  |   |          square brackets
    "              | |                 | | | |  |   +-- current fileformat
    "              | |                 | | | |  +-- number of lines
    "              | |                 | | | +-- preview flag in square brackets
    "              | |                 | | +-- help flag in square brackets
    "              | |                 | +-- readonly flag in square brackets
    "              | |                 +-- modified flag in square brackets
    "              | +-- shows paste mode
    "              +-- full path to file in the buffer

    function! PasteModeFlag()
        if &paste
            return '[PASTE MODE]'
        else
            return ''
        endif
    endfunction
"  }}}

" Text Formatting/Layout  {{{
    "set completeopt=    " don't use a pop up menu for completions
    set expandtab        " no real tabs please!
    set formatoptions=rq " Automatically insert comment leader on return,
                         " and let gq format comments

    set ignorecase       " case insensitive by default
    set infercase        " case inferred by default
    set smartcase        " if there are caps, go case-sensitive

    "set nowrap           " do not wrap line
    set wrap             " wrap line
    set lbr              " break at specified character instead of last one that fits on the screen
    "set breakat=\ ^\!@*-+;\:\,./? " break at those characters

    set shiftround       " when at 3 spaces, and I hit > ... go to 4, not 5
    set shiftwidth=4     " auto-indent amount when using cindent,
                         " >>, << and stuff like that

    set softtabstop=4    " when hitting tab or backspace, how many spaces
                         " should a tab be (see expandtab)
    set tabstop=4        " real tabs should be 8, and they will show with
                         " set list on
"  }}}

" Folding  {{{
    set foldenable        " Turn on folding
    set foldmarker={,}    " Fold C style code (only use this as default
                          " if you use a high foldlevel)
    set foldmethod=marker " Fold on the marker
    set foldlevel=100     " Don't autofold anything (but I can still
                          " fold manually)
    set foldopen=block,hor,mark,percent,quickfix,tag,jump,search " what movements
                                                                 " open folds
    function! SimpleFoldText()
        return getline(v:foldstart).' '
    endfunction

    set foldtext=SimpleFoldText() " Custom fold text function
                                  " (cleaner than default)
"  }}}

" Mappings  {{{
    " 'D' maps the 'Command'/Apple key
    "imap <D-cr> <cr>

    "Prevent OSX Keyboard to insert crazy stuff when accidentally pressing
    "Alt+Return
    imap <M-cr> <cr>
    " ROT13 - fun
    map <F12> ggVGg?

    let mapleader = ","
    let g:mapleader = ","

    " Fast editing of the .vimrc
    map <leader>e :e! ~/.vim/vimrc<cr>

    map <leader>fc :foldc<cr>
    map <leader>fC :%foldc<cr>
    map <leader>fo :foldo<cr>
    map <leader>fO :%foldo<cr>
"  }}}

" Moving around, tabs and buffers  {{{
    " space / shift-space scroll in normal mode
    noremap <S-space> <C-b>
    noremap <space> <C-f>

    " Make Arrow Keys Useful Again  {{{
        "map <down> <ESC>:bn<RETURN>
        "map <up> <ESC>:bp<RETURN>

        map <left> <ESC>:NERDTreeToggle<RETURN>
        " map <right> <ESC>:Tlist<RETURN>
        map <right> <ESC>:TagbarToggle<RETURN>
    "  }}}

    " Tab configuration
    map <leader>tn :tabnew<cr>
    map <leader>te :tabedit
    map <leader>tc :tabclose<cr>
    map <leader>tm :tabmove
    map <leader>tr :tabN<cr>
    map <leader>tl :tabp<cr>

    " When pressing <leader>cd switch to the directory of the open buffer
    map <leader>cd :cd %:p:h<cr>

"  }}}

" Visual Mode Related  {{{
    "  In visual mode when you press * or # to search for the current selection
    vnoremap <silent> * :call VisualSearch('f')<CR>
    vnoremap <silent> # :call VisualSearch('b')<CR>

    " When you press gv you vimgrep after the selected text
    vnoremap <silent> gv :call VisualSearch('gv')<CR>
    map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>


    function! CmdLine(str)
        exe "menu Foo.Bar :" . a:str
        emenu Foo.Bar
        unmenu Foo
    endfunction

    " From an idea by Michael Naumann
    function! VisualSearch(direction) range
        let l:saved_reg = @"
        execute "normal! vgvy"

        let l:pattern = escape(@", '\\/.*$^~[]')
        let l:pattern = substitute(l:pattern, "\n$", "", "")

        if a:direction == 'b'
            execute "normal ?" . l:pattern . "^M"
        elseif a:direction == 'gv'
            call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
        elseif a:direction == 'f'
            execute "normal /" . l:pattern . "^M"
        endif

        let @/ = l:pattern
        let @" = l:saved_reg
    endfunction
"  }}}

" Command Mode Related  {{{
    " Smart mappings on the command line
    cno $h e ~/
    cno $d e ~/Desktop/
    cno $j e ./
    cno $c e <C-\>eCurrentFileDir("e")<cr>

    " $q is super useful when browsing on the command line
    cno $q <C-\>eDeleteTillSlash()<cr>

    "cno $_ perldo

    " Bash like keys for the command line
    cnoremap <C-A>      <Home>
    cnoremap <C-E>      <End>
    cnoremap <C-K>      <C-U>

    cnoremap <C-P> <Up>
    cnoremap <C-N> <Down>

    func! DeleteTillSlash()
        let g:cmd = getcmdline()
        if MySys() == "linux" || MySys() == "mac"
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
        endif
        if g:cmd == g:cmd_edited
            if MySys() == "linux" || MySys() == "mac"
                let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
            else
                let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
            endif
        endif
        return g:cmd_edited
    endfunc

    func! CurrentFileDir(cmd)
        return a:cmd . " " . expand("%:p:h") . "/"
    endfunc

"  }}}

" Editing Mappings  {{{
    "Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
    nmap <M-j> mz:m+<cr>`z
    nmap <M-k> mz:m-2<cr>`z
    vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
    vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

    if MySys() == "mac"
        nmap <D-j> <M-j>
        nmap <D-k> <M-k>
        vmap <D-j> <M-j>
        vmap <D-k> <M-k>
    endif

    "Delete trailing white space, useful for Python ;)
    func! DeleteTrailingWS()
        exe "normal mz"
        %s/\s\+$//ge
        exe "normal `z"
    endfunc
    autocmd BufWrite *.py :call DeleteTrailingWS()
"  }}}

" Spell Checking  {{{
    "Pressing ,ss will toggle and untoggle spell checking
    map <leader>ss :setlocal spell!<cr>

    "Shortcuts using <leader>
    map <leader>sn ]s
    map <leader>sp [s
    map <leader>sa zg
    map <leader>s? z=
"  }}}

" JavaScript Section  {{{
    au FileType javascript imap <c-l> console.log();<esc>hi
    au FileType javascript call JavaScriptFold()
    "au FileType javascript setl nocindent

    function! JavaScriptFold()
        setl foldmethod=syntax
        setl foldlevelstart=100
        syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

        function! FoldText()
            return substitute(getline(v:foldstart), '{.*', '{...}', '')
        endfunction
        setl foldtext=FoldText()
        setl fen
    endfunction

    "let tlist_javascript_settings = 'JavaScript;m:module;r:role;c:class;f:function'
    "let tlist_javascript_settings = 'JavaScript;m:module;r:role;c:class'

    let g:tagbar_type_javascript = {
        \ 'ctagsbin' : '/usr/local/bin/jsctags'
    \ }

    let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
"  }}}

" php Section  {{{
    au FileType php imap <c-e> <?php echo  ?><esc>hhi
    au FileType php imap <c-p> <?php  ?><esc>hhi
    au FileType php imap <c-P> <?php<return><return>?><esc>k^i<tab>
"  }}}

" Fugitive Mappings  {{{
    map <leader>gc :Gcommit<cr>
    map <leader>Gp :!git pull
    map <leader>GP :!git push<cr>
    map <leader>gRR :VCSRevert<cr>
    map <leader>gs :Gstatus<cr>
"  }}}

" Command-T Mappings  {{{
    let g:CommandTMaxHeight = 15
    set wildignore+=*.o,*.obj,.git,*.pyc
    noremap <leader>o :CommandT<cr>
    "noremap <leader>y :CommandTFlush<cr>
"  }}}

" Cope Mappings  {{{
    map <leader>cc :botright cope<cr>
    map <leader>cw :botright cw<cr>
    map <leader>cq :ccl<cr>
    map <leader>n :cn<cr>
    map <leader>p :cp<cr>
"  }}}

" Plugin Settings  {{{
    let b:match_ignorecase = 1 " case is stupid
    let perl_extended_vars = 1 " highlight advanced perl vars
                               " inside strings

    " neocomplcache Settings  {{{
        let g:neocomplcache_enable_at_startup = 1 " enable at startup
        let g:neocomplcache_enable_smart_case = 1 " smartcase completion
        let g:neocomplcache_enable_camel_case_completion = 1 " camelcase completion
        let g:neocomplcache_enable_underbar_completion = 1 " underscore completion

        " Define keyword.
        if !exists('g:neocomplcache_keyword_patterns')
            let g:neocomplcache_keyword_patterns = {}
        endif
        let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

        imap <C-k>              <Plug>(neocomplcache_snippets_expand)
        smap <C-k>              <Plug>(neocomplcache_snippets_expand)

        inoremap <expr><C-g>    neocomplcache#undo_completion()
        inoremap <expr><C-l>    neocomplcache#complete_common_string()


        " SuperTab like snippets behavior.
        "imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
        imap <expr><Right> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<Right>"

        " Recommended key-mappings.
        " <CR>: close popup and save indent.
        inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
        " <TAB>: completion.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>  neocomplcache#close_popup()
        inoremap <expr><C-e>  neocomplcache#cancel_popup()

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        " Enable heavy omni completion.
        if !exists('g:neocomplcache_omni_patterns')
                let g:neocomplcache_omni_patterns = {}
        endif

        let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
        "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "  }}}

    " TagList Settings  {{{
        let Tlist_Auto_Open=0 " let the tag list open automatically
        let Tlist_Compact_Format = 1 " show small menu
        let Tlist_Ctags_Cmd = 'ctags' " location of ctags
        let Tlist_Enable_Fold_Column = 0 " do show folding tree
        let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill
                                        " yourself
        let Tlist_File_Fold_Auto_Close = 0 " fold closed other trees
        let Tlist_Sort_Type = "name" " order by
        let Tlist_Use_Right_Window = 1 " split to the right side
                                        " of the screen
        let Tlist_WinWidth = 40 " 40 cols wide, so i can (almost always)
                                 " read my functions
        " Language Specifics  {{{
            " just functions and classes please
            let tlist_aspjscript_settings = 'asp;f:function;c:class' 
            " just functions and subs please
            let tlist_aspvbs_settings = 'asp;f:function;s:sub' 
            " don't show variables in freaking php
            let tlist_php_settings = 'php;c:class;d:constant;f:function' 
            " just functions and classes please
            let tlist_vb_settings = 'asp;f:function;c:class' 
        "  }}}
    "  }}}

    " AutoPairs Settings  {{{
        let g:AutoPairsCenterLine = 0
    "  }}}

    " BufExplorer mappings
    map <leader>b :BufExplorer<cr>

    " YankRing settings and mappings  {{{
        let g:yankring_history_dir = '~/.vim/.yankring'
        map <leader>y :YRShow<cr>
    "  }}}

"  }}}

" Autocommands  {{{
    function! IndentFold() " Unused for now
        setlocal foldmethod=expr
        setlocal foldexpr=(getline(v:lnum)=~'^$')?-1:((indent(v:lnum)<indent(v:lnum+1))?('>'.indent(v:lnum+1)):indent(v:lnum))
        setlocal foldtext=getline(v:foldstart)
        setlocal fillchars=fold:\ "(there's a space after that \))"
    endfunction
    function! SetShortTabStops()
        setlocal shiftwidth=2
        setlocal softtabstop=2
    endfunction
    " Ruby  {{{
        " ruby standard 2 spaces, always
        "au BufRead,BufNewFile *.rb,*.rhtml call SetShortTabStops()
        au FileType ruby call SetShortTabStops()
    "  }}}
    " Apache  {{{
        " apache 2 spaces, always
        au FileType apache call SetShortTabStops()
    "  }}}
    " Coffeescript  {{{
        au FileType coffee call SetShortTabStops()
    "  }}}
"  }}}

" GUI Settings, colors and fonts  {{{
set background=dark " we plan to use a dark background
if has("gui_running")
    " Basics  {{{
        "colorscheme metacosm " my color scheme (only works in GUI)
        set columns=180 " perfect size for me
        set guifont=Monaco:h12 " My favorite font
        set guioptions=ce 
        "              ||
        "              |+-- use simple dialogs rather than pop-ups
        "              +  use GUI tabs, not console style tabs
        set lines=55 " perfect size for me
        set mousehide " hide the mouse cursor when typing
    "  }}}

    " Font Switching Binds  {{{
        "map <F8> <ESC>:set guifont=Consolas:h8<CR>
        "map <F9> <ESC>:set guifont=Consolas:h10<CR>
        "map <F10> <ESC>:set guifont=Consolas:h12<CR>
        "map <F11> <ESC>:set guifont=Consolas:h16<CR>
        "map <F12> <ESC>:set guifont=Consolas:h20<CR>
    "  }}}
else
    set noesckeys
endif
"  }}}

" Misc.  {{{
    " Remove the Windows ^M - when the encodings gets messed up
    noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

    "Quickly open a buffer for scripbble
    map <leader>q :e ~/buffer<cr>
    au BufRead,BufNewFile ~/buffer iab <buffer> xh1 ===========================================

    map <leader>pp :setlocal paste!<cr>

    map <leader>bb :cd ..<cr>

    " JavaScriptLint plugin
    let jslint_command = '~/Downloads/jsl-0.3.0-mac/jsl'
    "let jslint_command = '~/Development/Library/javascriptlint/build/install/jsl'
"  }}}
