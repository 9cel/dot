set number

set mouse=a

ino jk <Esc>
cno jk <Esc>

nno ; :
nno : ;

xno ; :
xno : ;

nno <Left> <Cmd>tabprev<CR>
nno <Right> <Cmd>tabnext<CR>

tno <C-i> <C-\><C-n>

nno <M-Up> <C-w>k
nno <M-Down> <C-w>j
nno <M-Left> <C-w>h
nno <M-Right> <C-w>l

ino <M-Up> <Cmd>wincmd k<CR>
ino <M-Down> <Cmd>wincmd j<CR>
ino <M-Left> <Cmd>wincmd h<CR>
ino <M-Right> <Cmd>wincmd l<CR>

tno <M-Up> <Cmd>wincmd k<CR>
tno <M-Down> <Cmd>wincmd j<CR>
tno <M-Left> <Cmd>wincmd h<CR>
tno <M-Right> <Cmd>wincmd l<CR>

filetype plugin indent on

set termguicolors

set statusline=
set statusline+=\[%n]                                    "buffernr
set statusline+=\ %<%F\                                  "File+path
set statusline+=\ %y\                                    "FileType
set statusline+=\ %{''.(&fenc!=''?&fenc:&enc).''}        "Encoding
set statusline+=\ %{(&bomb?\",BOM\":\"\")}\              "Encoding2
set statusline+=\ %{&ff}\                                "FileFormat (dos/unix..) 
set statusline+=\ %{&spelllang}\ \%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=\ %= "\ line:%l/%L\ (%03p%%)\               "Rownumber/total (%)
set statusline+=\ col:%03c\                              "Colnr
set statusline+=\ \ %m%r%w\ %P\ \                        "Modified? Readonly? Top/bot

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

" let g:gruvbox_material_background = 'soft'
" colors gruvbox-material

hi User1 guifg=#cccccc  guibg=#444444
hi User2 guifg=#cccccc  guibg=#333333
hi User3 guifg=#cccccc  guibg=#444444
hi User4 guifg=#cccccc  guibg=#333333
hi User5 guifg=#cccccc  guibg=#444444
hi User7 guifg=#cccccc  guibg=#333333 gui=bold
hi User8 guifg=#cccccc  guibg=#444444
hi User9 guifg=#cccccc  guibg=#333333
hi User0 guifg=#ff0000  guibg=#444444

hi tyIdentifier guifg=#E1C78F
hi tyArrayBracket guifg=#aca3c0
hi tyTypeParamsBracket guifg=#aca3c0
hi Normal guifg=#c49f8e

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

nnoremap <silent><nowait> <C-p> :FzfLua git_files<CR>

nno <silent><nowait> <space> :HopChar2<CR>

command! -nargs=0 SynID echom synIDattr(synID(line("."), col("."), 1), "name")

function! GetHighlight(trans) abort
  return join([
  \ synIDattr(synID(line('.'), col('.'), a:trans), 'name'),
  \ synIDattr(synIDtrans(synID(line('.'), col('.'), a:trans)), 'name')],
  \ ' -> ')
endfunction
nnoremap <Space>hl <Cmd>echo GetHighlight(0)<CR>
nnoremap <Space>ht <Cmd>echo GetHighlight(1)<CR>


function! EchoHighlights() abort
  let [l, c] = [line('.'), col('.')]
  for synid in reverse(synstack(line('.'), col('.')))
    let group = synIDattr(synid, 'name')
    echon group
    let translated = synIDattr(synIDtrans(synid), 'name')
    if translated !=# '' && group !=# translated
      echon '['
      execute 'echohl' translated
      echon translated
      echohl None
      echon ']'
    endif
    echon ' '
  endfor
endfunction

nnoremap <Space>hi <Cmd>call EchoHighlights()<CR>
