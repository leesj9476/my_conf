set nocompatible				" be iMproved, required
filetype off					" required

"Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Vundle plugin
Plugin 'VundleVim/Vundle.vim'

"interactive git <=> vim
Plugin 'tpope/vim-fugitive'

"HTML template
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

"view dir tree
Plugin 'The-NERD-tree'

"auto complete
Plugin 'Valloric/YouCompleteMe'

"taglist
Plugin 'taglist-plus'

"awesome status bar
Plugin 'vim-airline/vim-airline'

"awesome bash prompt
Plugin 'edkolev/promptline.vim'

"show diff from git file
Plugin 'airblade/vim-gitgutter'

"theme
Plugin 'nanotech/jellybeans.vim'

"nerdcommenter
Plugin 'scrooloose/nerdcommenter'

"syntax analyzer
Plugin 'w0rp/ale'

"search files
Plugin 'ctrlpvim/ctrlp.vim'

"documentation in comment
Plugin 'DoxygenToolkit.vim'

"vimshell
Plugin 'shougo/vimshell.vim'
Plugin 'shougo/vimproc.vim'

"buffer manager
Plugin 'jeetsukumaran/vim-buffergator'

"motion on speed
Plugin 'easymotion/vim-easymotion'

"multiple string cursor
Plugin 'terryma/vim-multiple-cursors'

call vundle#end()			" required
filetype plugin indent on	" required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"theme
"
syntax enable
colorscheme jellybeans


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"basic option
"
set history=100	"save editing history maximum 100
set nobackup	"don't make .*~ file
set noswapfile	"don't make .swp file
set t_Co=256	"256 colors
set noautochdir	"block automatically changing directory
set encoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"indentation
"
set tabstop=4		"tab size is 4
set shiftwidth=4	"auto indent size is 4
set smartindent		"smart indentation
set autoindent		"auto indentation
set cindent			"c style indentation

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"searching
"
set showmatch	"matched parentheses highlight
set hlsearch	"highlight search
set incsearch	"highlight gradually
set nowrapscan	"don't back to start point from EOF
set ignorecase	"ignore upper and lower case
set smartcase	"if upper case is exist on searching word,
				"ignore 'set ignorecase'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"showing
"
set nu			"show line number
set ruler		"show current cursor pos
set showcmd		"show waiting command
set showmode	"show mode to status bar
set wildmenu
set laststatus=2	"show status info always
set nocursorline	"remove line where cursor is exist

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"cscope
"
set csprg=/usr/bin/cscope
set csto=0
set nocsverb

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"other func
"
set visualbell	"use visual bell instead of beep sound
set mouse=a		"enable mouse use
set backspace=indent,eol,start	"when typing backspace at end, start and indent,
								"go back to previous line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctags
"
"find tags file until 4th upper directory
set tags=./tags,../tags,../../tags,../../../tags,../../../../tags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"cscope
"
"shortcut
if has("cscope")
	set cscopetag
	if filereadable("cscope.out")
		cs add cscope.out
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set cscopeverbose

	nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-\>d :cs find d ^<C-R>=expand("<cword>")<CR><CR>

	nmap <C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

	nmap <C-@><C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-@><C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-@><C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"YouCompleteMe
"
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

"auto complete select shortcut
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

"close preview tab after acception of offered completion string
let g:ycm_autoclose_preview_window_after_completion = 1

"use ctags
let g:ycm_collect_identifiers_from_tags_files = 1

"shortcut
nmap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>d :YcmCompleter GoToDeclaration<CR>
nmap <leader>t :YcmCompleter GetType<CR>
nmap <leader>p :YcmCompleter GetParent<CR>
let g:ycm_key_list_stop_completion = ['<Enter>']

"no show diagnostic ui
let g:ycm_show_diagnostics_ui = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERDTree

"quit NERDTree when left window is only taglist, NERDTree or both
function! CheckLeftBuffers()
	if tabpagenr('$') == 1
	let i = 1
	while i <= winnr('$')
		if getbufvar(winbufnr(i), '&buftype') == 'help' ||
			\ getbufvar(winbufnr(i), '&buftype') == 'quickfix' ||
			\ exists('t:NERDTreeBufName') &&
			\	 bufname(winbufnr(i)) == t:NERDTreeBufName ||
			\ bufname(winbufnr(i)) == '__Tag_List__'
		let i += 1
		else
		break
		endif
	endwhile
	if i == winnr('$') + 1
		qall
	endif
	unlet i
	endif
endfunction
autocmd BufEnter * call CheckLeftBuffers()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"taglist

"taglist is closed when the only window is taglist window
let Tlist_Exit_OnlyWindow = 1

"show current file's taglist
let Tlist_Show_One_File = 1

"when new file is edited, update ctags file automatically
let Tlist_Auto_Update = 1

"ctags directory
let Tlist_Ctags_Cmd='/usr/bin/ctags'

"prevent taglist width set to 0
let Tlist_Inc_Winwidth = 0

"set default width to 30
let Tlist_Winwidth = 30

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"taglist, nerdtree -> one sidebar
"
function! ToggleNerdtreeTaglist()
	let NERDTree_close = (bufwinnr('NERD_tree') == -1)
	let Taglist_close = (bufwinnr('__Tag_List__') == -1)

	if NERDTree_close && !Taglist_close
		NERDTreeToggle
	endif
	
	if !NERDTree_close && Taglist_close
		TlistToggle
	endif

	TlistToggle
	NERDTreeToggle

	if NERDTree_close && Taglist_close
		wincmd K
		wincmd b
		wincmd L
		wincmd h
		exe 'vertical resize 30'
	endif
endfunction

autocmd StdinReadPre * let s:std_in = 1
function! StartNerdtreeTaglist()
	if argc() == 0
		silent NERDTreeToggle
	else
		call ToggleNerdtreeTaglist()
		call feedkeys("\<C-W>\<Right>")
	end
endfunction

autocmd VimEnter * call StartNerdtreeTaglist()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nerd commenter
"
"multi-line compact comment: <leader><c><s>
"single-line comment: <leader><c><c>
"
"add 1 space after delemiters
let g:NERDSpaceDelims = 1

"set align to left
let g:NERDDefaultAlign = 'left'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-airline
"
"enable buffer line
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"promptline
"
"promptline theme
let g:promptline_theme = 'vim_statusline_3'

"promptline preset
let g:promptline_preset = {
	\ 'a'	: [ '\u' ],
	\ 'b'	: [ '\t', '\w' ],
	\ 'x'	: [ promptline#slices#vcs_branch(), '$(git rev-parse --short HEAD 2>/dev/null)'],
	\ 'z'	: [ promptline#slices#last_exit_code() ]}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ale
"
"airline extension
let g:airline#extensions#ale#enabled = 1

"error and warning symbol
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

"error and warning str format
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"no check when first load
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

"show quickfix list
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

"C
let g:ale_c_gcc_options = '-std=c11 -Wall -Wextra -Wpedantic'

"C++
let g:ale_cpp_gcc_executable = 'g++'
let g:ycm_cpp_gcc_options = '-std=c++11 -Wall -Wextra -Wpedantic'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"ctrlp
"
"ignore dirs and files
let g:ctrlp_custom_ignore = {
	\ 'dir': '\.git$\|public$\|log$\|tmp$\|vendor$',
	\ 'file': '\v\.(exe|so|dll)$'
\}

"set closest .git directory to cwd
let g:ctrlp_working_path_mode = 'ra'

"set cursorline color
hi cursorline cterm=none ctermbg=darkgray ctermfg=white 
set nocursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"DoxygetToolkit
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"buffergator
"
"hide buffer immediatly after editing buffer
set hidden

"set shortcut by myself
let g:buffergator_suppress_keymap = 1

"buffer cycle
let g:buffergator_mru_cycle_loop = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-multiple-cursor
"
"disable default setting
let g:multi_cursor_use_default_mapping = 0

let g:multi_cursor_next_key = '<C-N>'
let g:multi_cursor_prev_key = '<C-P>'
let g:multi_cursor_skip_key = '<C-X>'
let g:multi_cursor_quit_key = '<Esc>'

hi Visual cterm=none ctermbg=darkgray ctermfg=white

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"shortcut
"
nmap <F3> :enew<CR>
nmap <F5> :VimShell<CR>
nmap <F6> :NERDTreeToggle<CR>
nmap <F7> :TlistToggle<CR>
nmap <F8> :call ToggleNerdtreeTaglist()<CR>
nmap <F9> :Dox<CR>

"buffer shortcut
nmap <C-D> :bp <BAR> bd #<CR>
nmap <C-J> :BuffergatorMruCyclePrev<CR>
nmap <C-K> :BuffergatorMruCycleNext<CR>
nmap <C-L> :BuffergatorTabsToggle<CR>
