function theme --description "Switches theme to light or dark mode" --argument-names mode
    if test $mode = light
        fish_config theme choose "Rosé Pine Dawn"
        cat "$HOME/.config/kitty/themes/rose-pine-dawn.conf" >"$HOME/.config/kitty/current-theme.conf"
        kitty @ set-colors -a "$HOME/.config/kitty/themes/rose-pine-dawn.conf"
        tmux source-file ~/.config/tmux/themes/rose-pine-dawn.conf
        echo light >"$HOME/.theme"
    else if test $mode = dark
        fish_config theme choose "Rosé Pine Moon"
        kitty @ set-colors -a "$HOME/.config/kitty/themes/rose-pine-moon.conf"
        cat "$HOME/.config/kitty/themes/rose-pine-moon.conf" >"$HOME/.config/kitty/current-theme.conf"
        tmux source-file ~/.config/tmux/themes/rose-pine-moon.conf
        echo dark >"$HOME/.theme"
    end
end
