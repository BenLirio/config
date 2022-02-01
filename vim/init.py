import vim

vim.command("command Math :py3file ~/src/github.com/BenLirio/config/vim/eval-line.py")
vim.command("command OcamlComplete :py3file ~/src/github.com/BenLirio/config/vim/ocaml-complete.py")
vim.command("command SchemeComplete :py3file ~/src/github.com/BenLirio/config/vim/scheme-complete.py")
vim.command("nm M :py3file ~/src/github.com/BenLirio/config/vim/manual.py<CR>")
vim.command("nm 1M :py3file ~/src/github.com/BenLirio/config/vim/manual-edit.py<CR>")
vim.command("colorscheme torte")


vim.command("syntax on")
vim.command("set autoindent")

vim.command("filetype plugin indent on")
vim.command("set tabstop=2")
vim.command("set shiftwidth=2")
vim.command("set expandtab")
