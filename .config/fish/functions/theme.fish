function theme --description "Switches theme to light or dark mode" --argument-names mode
    if test $mode = light
        echo light >"$HOME/.theme"
        fish_config theme choose "Rosé Pine Dawn"
    else if test $mode = dark
        echo dark >"$HOME/.theme"
        fish_config theme choose "Rosé Pine Moon"
    end
end
