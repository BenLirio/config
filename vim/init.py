import vim

vim.command("command Math :py3file ~/src/github.com/BenLirio/config/vim/eval-line.py")
vim.command("nm M :py3file ~/src/github.com/BenLirio/config/vim/manual.py<CR>")
vim.command("nm 1M :py3file ~/src/github.com/BenLirio/config/vim/manual-edit.py<CR>")
vim.command("colorscheme torte")


vim.command("syntax on")
vim.command("set autoindent")

vim.command("filetype plugin indent on")
vim.command("set tabstop=4")
vim.command("set shiftwidth=4")
vim.command("set expandtab")
