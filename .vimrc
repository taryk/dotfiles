nmap <C-F5> <Esc>:BufExplorer<cr>
vmap <C-F5> <esc>:BufExplorer<cr>
imap <C-F5> <esc>:BufExplorer<cr>

" F6 - prev buffer
nmap <C-F6> :bp<cr>
vmap <C-F6> <esc>:bp<cr>i
imap <C-F6> <esc>:bp<cr>i

" F7 - next buffer
nmap <C-F7> :bn<cr>
vmap <C-F7> <esc>:bn<cr>i
imap <C-F7> <esc>:bn<cr>i


" NERD tree
call s:initNerdTree(getcwd())


nmap <F5> :NERDTree<cr>
vmap <F5> <esc>:NERDTree<cr>i
imap <F5> <esc>:NERDTree<cr>i

nmap <C-N>x :NERDTreeClose<cr>
vmap <C-N>x <esc>:NERDTreeClose<cr>i
imap <C-N>x <esc>:NERDTreeClose<cr>i

set stl=[b%n]%m%r[%t][type:%Y]%=-->[%b,0x%B]<--\ [%l/%L,%c][%p%%]
