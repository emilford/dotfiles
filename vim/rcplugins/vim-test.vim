Plugin 'janko-m/vim-test'

let test#strategy = "vtr"
let test#ruby#bundle_exec = 0

let test#runners = {'JavaScript': ['Teaspoon']}
let test#javascript#runner = 'teaspoon'

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
