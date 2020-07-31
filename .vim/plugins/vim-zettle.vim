Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel'

" let wiki_defaults = { 'auto_tags': 1, 'auto_toc': 1 }
let wiki_defaults = {
  \ 'auto_diary_index': 1,
  \ 'auto_tags': 1,
  \ 'auto_toc': 1,
  \ 'ext': '.md',
  \ 'syntax': 'markdown'
  \ }
" let zettelkasten_wiki = {}
" let zettelkasten_wiki.path = '~/Documents/Notes/Zettelkasten'
" let zettelkasten_wiki.auto_tags = 1
" let zettelkasten_wiki.auto_toc = 1
" let zettelkasten_wiki.syntax = 'markdown'
" let zettelkasten_wiki.ext = 'md'

" let g:vimwiki_list = [zettelkasten_wiki]


let g:vimwiki_list = [
  \ extend(copy(wiki_defaults), { 'path': '~/Documents/Notes/Zettelkasten' })
  \ ]

let g:vimwiki_table_mappings = 0
            " \{'path': '~/VimWiki', 'syntax': 'markdown', 'ext': '.md'},

" let g:vimwiki_list = [{"path":"~/Dropbox/Notes/", 'auto_tags': 1, 'auto_toc': 1}]
" let g:vimwiki_use_mouse = 1
" let g:vimwiki_folding = 'expr'
let g:vimwiki_auto_chdir = 1

let g:zettel_options = [{'front_matter' : {'tags' : ''}, 'template' :  '~/Documents/zettel.tpl', 'ext':'.md', 'syntax':'markdown' }]
let g:zettel_format = '%Y%m%d%H%M%S-%title'
let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "



" search by tag
nnoremap <leader>vt :VimwikiSearchTags<space>

" search by text
nnoremap <leader>vs :VimwikiSearch<space>

nnoremap <leader>gt :VimwikiRebuildTags!<cr>:VimwikiGenerateTagLinks<cr><c-l>

nnoremap <leader>zl :ZettelSearch<cr>

nnoremap <leader>zn :ZettelNew<cr><cr>:4d<cr>:w<cr>ggA

nnoremap <leader>bl :VimwikiBacklinks<cr>
