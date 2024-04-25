function theme --description "Switches theme to light or dark mode" --argument-names mode
    if test $mode = light
        echo light >"$HOME/.theme"
        fish_config theme choose "Rosé Pine Dawn"
        cat "$HOME/.config/kitty/themes/rose-pine-dawn.conf" >"$HOME/.config/kitty/current-theme.conf"

        if set -q KITTY_PID
            kill -SIGUSR1 $KITTY_PID
        end
    else if test $mode = dark
        echo dark >"$HOME/.theme"
        fish_config theme choose "Rosé Pine Moon"
        cat "$HOME/.config/kitty/themes/rose-pine-moon.conf" >"$HOME/.config/kitty/current-theme.conf"

        if set -q KITTY_PID
            kill -SIGUSR1 $KITTY_PID
        end
    end
end
