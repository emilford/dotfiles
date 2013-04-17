function! DispatchRunCommandBackground()
  let l:command = substitute(input("Command? "), '`', '\\`', 'g')
  exec ":Dispatch!" l:command
endfunction

function! DispatchRunCommand()
  let l:command = substitute(input("Command? "), '`', '\\`', 'g')
  exec "Dispatch" l:command
endfunction

command! -nargs=0 DispatchRunCommandBackground call DispatchRunCommandBackground()
command! -nargs=0 DispatchRunCommand call DispatchRunCommand()

