function projections --description "Create projections relevant to current directory"
  set -l projections_path "$HOME/.config/projections"
  set -l projection_files

  if test -f "config/routes.rb"
    set -a projection_files "$projections_path/rails.json"
  end

  if test -f "spec/spec_helper.rb"
    set -a projection_files "$projections_path/rspec.json"
  end

  if test (count $projection_files) -gt 0
    jq -s 'reduce .[] as $item ({}; . * $item)' $projection_files > .projections.json
  end
end
