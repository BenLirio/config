import vim

vim.command("command Math :py3file ~/src/github.com/BenLirio/config/vim/eval-line.py")

vim.command("syntax on")
vim.command("set autoindent")

#"Indent
#filetype plugin indent on
#" Existing tab with 4 spaces
#set tabstop=4
#" When pressing >
#set shiftwidth=4
#" On pressing <TAB> insert 4 spaces
#set expandtab
