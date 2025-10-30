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

let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system('/mnt/c/Windows/System32/clip.exe', @0) | endif
    augroup END
endif

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

call plug#begin(stdpath('data') . '/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
"Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'olimorris/onedarkpro.nvim'
Plug 'phaazon/hop.nvim'
Plug 'ayu-theme/ayu-vim'
Plug 'olivertaylor/vacme'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'srcery-colors/srcery-vim'
Plug 'igungor/schellar'
Plug 'sainnhe/gruvbox-material'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'https://git.sr.ht/~sircmpwn/hare.vim'
Plug 'marchelzo/ty.vim'

" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'ray-x/lsp_signature.nvim'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'

"  Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'VonHeikemen/lsp-zero.nvim'
Plug 'evanleck/vim-svelte'
Plug 'hail2u/vim-css3-syntax'
Plug 'norcalli/nvim-terminal.lua'
call plug#end()

let ayucolor="dark"
let g:gruvbox_material_background = 'soft'

colors gruvbox-material

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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
" 
" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" " Mappings for CoCList
" " Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

nnoremap <silent><nowait> <C-p> :GFiles<CR>

lua require'hop'.setup()

lua <<EOF
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()
lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

require('lspconfig').clangd.setup({})
EOF


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

lua require'terminal'.setup()
lua vim.lsp.enable('tyd')
