let defaults = {}
let defaults.syntax = "markdown"
let defaults.ext = ".md"

let german = {}
let german.name = "German Velasco"
let german.path = "~/Code/emilford/German.Velasco"

let louis = {}
let louis.name = "Louis Antonopoulos"
let louis.path = "~/Code/emilford/Louis.Antonopoulos"

let mike = {}
let mike.name = "Mike Burns"
let mike.path = "~/Code/emilford/Mike.Burns"

let stephen = {}
let stephen.name = "Stephen Hanson"
let stephen.path = "~/Code/emilford/Stephen.Hanson"

let zettelkasten = {}
let zettelkasten.name = "Zettelkasten"
let zettelkasten.path = "~/Documents/Notes/Zettelkasten"

" let zettelkasten.auto_diary_index = 1
" let zettelkasten.auto_generate_links = 1
" let zettelkasten.auto_tags = 1
" let zettelkasten.auto_toc = 1
" let zettelkasten.links_space_char = "-"

let g:vimwiki_auto_chdir = 1
"let g:vimwiki_key_mappings = { "all_maps": 0, "global": 1}
let g:vimwiki_list = [
			\ extendnew(defaults, german),
			\ extendnew(defaults, louis),
			\ extendnew(defaults, mike),
			\ extendnew(defaults, stephen),
			\ extendnew(defaults, zettelkasten)
			\ ]
