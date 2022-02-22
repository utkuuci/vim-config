call plug#begin('~/.vim/plugged')
 	Plug 'scrooloose/nerdtree' 
	Plug 'vim-airline/vim-airline'
	Plug 'othree/javascript-libraries-syntax.vim'
	Plug 'posva/vim-vue'
	Plug 'nanotech/jellybeans.vim'
	Plug 'mxw/vim-jsx'
	Plug 'pangloss/vim-javascript'
	Plug 'altercation/vim-colors-solarized'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'liuchengxu/space-vim-dark'
	Plug 'fatih/vim-go'
	Plug 'plasticboy/vim-markdown'
	Plug 'mattn/emmet-vim'
	Plug 'scrooloose/syntastic'
	Plug 'plasticboy/vim-markdown'
	Plug 'omnisharp/omnisharp-vim'
	Plug 'ap/vim-css-color'
	Plug 'tpope/vim-surround'
	Plug 'sheerun/vim-polyglot'
	Plug 'tomasr/molokai'
	""Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'kjssad/quantum.vim'
	Plug 'ale-cci/aqua-vim'
	Plug 'nlknguyen/papercolor-theme'
	Plug 'joshdick/onedark.vim'
call plug#end()
"nerd tree ye kysayol tu? atamaasy
map <C-n> :NERDTreeToggle<CR>

"source $VIMRUNTIME/vimrc_example.vim

set hls
set is
set cb=unnamed
set gfn=Fixedsys:h10
set ts=4
set sw=4
set si

inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

set nu
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set rnu
    autocmd BufLeave,FocusLost,InsertEnter * set nornu
augroup END

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
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
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


