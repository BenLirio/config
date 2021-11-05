import vim
import re
import os

def get_word():
    cursor = vim.current.window.cursor
    lineIdx = cursor[0] - 1
    charIdx = cursor[1]
    lines = vim.current.buffer

    textAfter = lines[lineIdx][charIdx:]
    manual = re.split("\W+", textAfter)[0]
    return manual

manual = get_word()
if len(manual) > 0:
    homePath = os.getenv("HOME")
    manualPath = f"{homePath}/src/github.com/BenLirio/config/vim/manuals/{manual}"
    vim.command(f":tabedit {manualPath}")
else:
    print("No word selected")
