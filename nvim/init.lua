require("config.lazy")

vim.cmd("set number")

vim.cmd("set mouse=a")

vim.cmd("ino jk <Esc>")
vim.cmd("cno jk <Esc>")

vim.cmd("nno ; :")
vim.cmd("nno : ;")

vim.cmd("xno ; :")
vim.cmd("xno : ;")

vim.cmd("nno <Left> <Cmd>tabprev<CR>")
vim.cmd("nno <Right> <Cmd>tabnext<CR>")

vim.cmd("tno <C-i> <C-\\><C-n>")

vim.cmd("nno <M-Up> <C-w>k")
vim.cmd("nno <M-Down> <C-w>j")
vim.cmd("nno <M-Left> <C-w>h")
vim.cmd("nno <M-Right> <C-w>l")

vim.cmd("ino <M-Up> <Cmd>wincmd k<CR>")
vim.cmd("ino <M-Down> <Cmd>wincmd j<CR>")
vim.cmd("ino <M-Left> <Cmd>wincmd h<CR>")
vim.cmd("ino <M-Right> <Cmd>wincmd l<CR>")

vim.cmd("tno <M-Up> <Cmd>wincmd k<CR>")
vim.cmd("tno <M-Down> <Cmd>wincmd j<CR>")
vim.cmd("tno <M-Left> <Cmd>wincmd h<CR>")
vim.cmd("tno <M-Right> <Cmd>wincmd l<CR>")

vim.cmd("filetype plugin indent on")
vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/conf.vim")

vim.lsp.enable('tyd')
vim.lsp.enable('clangd')
