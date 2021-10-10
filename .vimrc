syntax on
set autoindent

"Indent
filetype plugin indent on
" Existing tab with 4 spaces
set tabstop=4
" When pressing >
set shiftwidth=4
" On pressing <TAB> insert 4 spaces
set expandtab




" Others

"py3 <<EOF
"def codex():
"    import vim
"    import os
"    import openai
"
"    openai.api_key = os.getenv("OPENAI_API_KEY")
"    prompt = "\n".join(list(vim.current.range))
"
"    response = openai.Completion.create(
"      engine="davinci-codex",
"      prompt=prompt,
"      temperature=0,
"      max_tokens=200,
"      top_p=1,
"      frequency_penalty=0,
"      presence_penalty=0,
"    )
"    lines = response.choices[0].text.split("\n")
"    idx = vim.current.range.end
"    vim.current.buffer[idx] += lines[0]
"    vim.current.buffer.append(lines[1:], idx+1)
"EOF
"map ,c :py3 codex() <CR>

"Go
"map <space>gof :%!gofmt <Return>
"map <space>gor :!clear && go run .<Return>
"map <space>got :!clear && go test -v \| sed "s/FAIL/$(printf '\033[31m')FAIL$(printf '\033[0m')/g" \| sed "s/SKIP/$(printf '\033[94m')SKIP$(printf '\033[0m')/g"<Return>

"Julia
"map <space>jlr :!clear && julia %<CR>

"Binary
"map <space>xxd :%!xxd <CR>
"map <space>xxr :%!xxd -r <CR>

"Davinci-instruct-beta
"map ,gdi :!python3 ~/davinci-instruct-beta.py <CR>

"Davinci
"map ,gd :!python3 ~/davinci.py <CR>

"Davinci-instruct-beta
"map ,gc :!python3 ~/curie.py <CR>

"Knowledge Graph
"map ,k :!python ~/knowledge_graph.py <CR>

"Concept net
"map ,c :!python3 ~/concept.py <CR>

"Entities
"map ,e :!python3 ~/entities.py <CR>

"Syntax
"map ,s :!python3 ~/syntax.py <CR>

"Syntax
"map ,f :!python3 ~/grammar.py <CR>

"Syntax
"map ,w :!python3 ~/wiki.py <CR>

"Codex
"map ,x :!python3 ~/codex.py <CR>



"Project specific

"map goh :!clear && ~/src/github.com/BenLirio/begin/run_host.sh <Return>
"map gos :!clear && ~/src/github.com/BenLirio/begin/run_scratch.sh <Return>
