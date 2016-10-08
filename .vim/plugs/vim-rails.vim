Plug 'tpope/vim-rails'

let g:rails_projections = {
\ "app/constraints/*_constraint.rb": {
\   "command": "constraint",
\   "template": "class %SConstraint\nend",
\   "test": [
\     "spec/constraints/%s_constraint_spec.rb"
\   ]
\ },
\ "app/jobs/*_job.rb": {
\   "command": "job",
\   "template": "class %SJob\nend",
\   "test": [
\     "spec/jobs/%s_job_spec.rb"
\   ]
\ },
\ "app/services/*.rb": {
\   "command": "service",
\   "template": "class %S\nend",
\   "test": [
\     "spec/services/%s_spec.rb"
\   ]
\ },
\ "app/policies/*_policy.rb": {
\   "command": "policy",
\   "template": "class %SPolicy\n  class Scope\n  end\nend",
\   "test": [
\     "spec/policies/%s_policy_spec.rb"
\   ]
\ },
\ "app/decorators/*_decorator.rb": {
\   "command": "decorator",
\   "template": "class %SDecorator < Draper::Decorator\nend",
\   "test": [
\     "spec/decorators/%s_decorator_spec.rb"
\   ]
\ },
\ "app/serializers/*_serializer.rb": {
\   "command": "serializer",
\   "template": "class %SSerializer < ActiveModel::Serializer\nend",
\   "test": [
\     "spec/serializers/%s_serializer_spec.rb"
\   ]
\ },
\ "app/views/pages/*.html.erb": {
\     "command": "page"
\  },
\ "config/routes.rb": {"command": "routes"},
\ "spec/features/*_spec.rb": {"command": "feature"},
\ "spec/requests/*_spec.rb": {"command": "request"},
\ "spec/support/*.rb": {"command": "support"},
\ "spec/factories.rb": {"command": "factories"},
\ "spec/factories/*.rb": {"command": "factories"}
\ }
