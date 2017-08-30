function weather --argument location --description "Display a weather report for a given location"
  if not test -n "$location"
    set location "Washington, DC"
  end

  curl -H "Accept-Language: en" "wttr.in/$location?u"
end

