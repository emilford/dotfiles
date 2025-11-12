function theme --description "Switches theme to light or dark mode" --argument-names mode
    if test $mode = light
        echo light >"$HOME/.theme"
        fish_config theme choose "Rosé Pine Dawn"
        set -Ux FZF_DEFAULT_OPTS "
    --color=fg:#797593,bg:#faf4ed,hl:#d7827e
    --color=fg+:#575279,bg+:#f2e9e1,hl+:#d7827e
    --color=border:#dfdad9,header:#286983,gutter:#faf4ed
    --color=spinner:#ea9d34,info:#56949f
    --color=pointer:#907aa9,marker:#b4637a,prompt:#797593"
    else if test $mode = dark
        echo dark >"$HOME/.theme"
        fish_config theme choose "Rosé Pine Moon"
        set -Ux FZF_DEFAULT_OPTS "
	--color=fg:#908caa,bg:#232136,hl:#ea9a97
	--color=fg+:#e0def4,bg+:#393552,hl+:#ea9a97
	--color=border:#44415a,header:#3e8fb0,gutter:#232136
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
    end
end
