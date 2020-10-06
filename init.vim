    " Install Vim Plug if not installed
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall
    endif

    call plug#begin()

    function! DoRemote(arg)
      UpdateRemotePlugins
    endfunction
    Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
    Plug 'neomake/neomake', { 'on': 'Neomake' }
    Plug 'ludovicchabant/vim-gutentags'
		Plug 'w0rp/ale'
		Plug 'preservim/nerdtree'
    Plug 'ctrlpvim/ctrlp.vim'
	
	"vim-go
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


    "Javascript Plugins
    Plug 'pangloss/vim-javascript'
    Plug 'carlitux/deoplete-ternjs'
    Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }

    "Typescript Plugins
    Plug 'Shougo/vimproc.vim', { 'do': 'make' }
    Plug 'Quramy/tsuquyomi'
		Plug 'mhartington/nvim-typescript', {'do': ':!install.sh \| UpdateRemotePlugins'}
    Plug 'mhartington/deoplete-typescript'

    call plug#end()
		"eslint config
		let g:ale_fixers = {
			\ 'javascript': ['eslint']
			\ }
 
		let g:ale_sign_error = '❌'
		let g:ale_sign_warning = '⚠️'
		let g:ale_fix_on_save = 1

    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_ignore_case = 1
    let g:deoplete#enable_camel_case = 1
		call deoplete#custom#option('smart_case', v:true)
    let g:deoplete#max_abbr_width = 0
    let g:deoplete#max_menu_width = 0

		call deoplete#custom#option(g:,'deoplete#omni#input_patterns',{})
    call deoplete#custom#option('_', 'matchers', ['matcher_full_fuzzy'])
		
    let g:tern_request_timeout = 1
    let g:tern_request_timeout = 6000
    let g:tern#command = ["tern"]
    let g:tern#arguments = ["--persistent"]
    let g:deoplete#sources#tss#javascript_support = 1
    let g:tsuquyomi_javascript_support = 1
    let g:tsuquyomi_auto_open = 1
    let g:tsuquyomi_disable_quickfix = 1
		let NERDTreeShowHidden=1

    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] "Hide files in .gitignore
    let g:ctrlp_show_hidden = 1                                                         "Show dotfiles

    " let g:ackprg = 'ag --vimgrep' " for replacing vimgrep with the silver seacher(ag)

    set tabstop=2       " number of visual spaces per TAB
    set softtabstop=2   " number of spaces in tab when editing
    set shiftwidth=2    " number of spaces to use for autoindente
		set expandtab       " set tabs to spaces
		set nu							" number on the side
    set relativenumber  " sets the number relative to where curser is

    autocmd! BufWritePost * Neomake
    let g:neomake_warning_sign = {
      \ 'text': '?',
      \ 'texthl': 'WarningMsg',
      \ }

    let g:neomake_error_sign = {
      \ 'text': 'X',
      \ 'texthl': 'ErrorMsg',
      \ }

		let mapleader=";"
		" map <C-n> :NERDTreeToggle <CR>
		inoremap kj <Esc>

    " disables <esc> so kj has to be used to enter normal mode
    inoremap <esc> <nop>

    " maps to ; dd
    nnoremap <leader>d dd

    " maps to ; <spacebar>
		nnoremap <leader><Space> :NERDTreeToggle<CR>


		" toggle line numbers
    nnoremap <silent> <leader>n :set number! number?<CR>

    nnoremap <silent> <leader>r :set relativenumber! relativenumber?<CR>

    " deletes line while in insert mode
    inoremap <c-d> <esc>ddi 

    " highlights word and makes it uppercase
    vnoremap <c-u> <esc>veU

    " allows for fast editing of neovim file
    nnoremap <leader>ev :vsplit $MYVIMRC<cr>

    " allows to source neovim
    nnoremap <leader>sv :source $MYVIMRC<cr>
    
    " wrap a word with single quotes ;'
    nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

    " maps split navigation
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

    " toggles highlight search
    nnoremap <F3> :set hlsearch!<CR>

    " autocmd FileType javascript :iabbrev <buffer> iff if()<left>kjx
    augroup filetype_html
    autocmd!
    autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
  augroup END

  " ----------------------------
  "  Go syntax highlighting ----
  "  ---------------------------

  au FileType go set noexpandtab
  au FileType go set shiftwidth=4
  au FileType go set softtabstop=4
  au FileType go set tabstop=4

  let g:go_highlight_build_constraints = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_types = 1
  let g:go_auto_sameids = 1

  echo "(>^.^<)" 
