function ngrok --wraps ngrok --description "Wrap ngrok to append XDG config file"
    command ngrok \
        --config="$HOME/Library/Application Support/ngrok/ngrok.yml" \
        --config="$HOME/.config/ngrok/ngrok.yml" \
        $argv
end
