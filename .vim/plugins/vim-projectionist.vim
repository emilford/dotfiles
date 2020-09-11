" Plug 'tpope/vim-projectionist'

let g:rails_gem_projections = {
      \   "pundit": {
      \     "app/policies/*_policy.rb": {
      \       "command": "policy",
      \       "template": "class {camelcase|capitalize|colons}Policy < ApplicationPolicy\n  class Scope < Scope\n  end\nend",
      \       "test": [
      \         "spec/policies/{}_policy_spec.rb"
      \       ]
      \     }
      \   },
      \   "draper": {
      \     "app/decorators/*_decorator.rb": {
      \       "command": "decorator",
      \       "template": "class {camelcase|capitalize|colons}Decorator < Draper::Decorator\nend",
      \       "test": [
      \         "spec/decorators/{}_decorator_spec.rb"
      \       ]
      \     }
      \   }
      \ }

let g:rails_projections = {
      \   "app/services/*.rb": {
      \     "command": "service",
      \     "template": "class {camelcase|capitalize|colons}\nend",
      \     "test": [
      \       "spec/services/{}_spec.rb"
      \     ]
      \   },
      \   "app/views/pages/*.html.erb": {
      \     "command": "page"
      \   },
      \   "config/routes.rb": {"command": "routes"},
      \   "spec/features/*_spec.rb": {"command": "feature"},
      \   "spec/requests/*_spec.rb": {"command": "feature"},
      \   "spec/support/*.rb": {"command": "support"},
      \   "spec/factories.rb": {"command": "factories"},
      \   "spec/factories/*.rb": {"command": "factories"}
      \ }
