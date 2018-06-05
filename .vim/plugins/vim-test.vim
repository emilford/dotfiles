Plug 'janko-m/vim-test'

let test#strategy = "vtr"
let test#ruby#bundle_exec = 0

let g:test#ruby#minitest#executable = 'm'

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
