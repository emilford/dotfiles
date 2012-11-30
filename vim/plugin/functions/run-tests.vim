function! SetTestFile()
    let s:test_file=@%
endfunction

function! RunTestFile()
    let in_spec_file         = match(expand("%"), '_spec.rb$') != -1
    let in_test_file         = match(expand("%"), '_test.rb$') != -1
    let in_feature_file      = match(expand("%"), '.feature$') != -1
    let in_jasmine_spec_file = match(expand("%"), '_spec.coffee$') != -1

    write

    if in_spec_file
      call SetTestFile()
      call RunSpec(s:test_file)
    elseif in_test_file
      call SetTestFile()
      call RunTest(s:test_file)
    elseif in_feature_file
      call SetTestFile()
      call RunFeature(s:test_file)
    elseif in_jasmine_spec_file
      call SetTestFile()
      call RunJasmineHeadlessFeature(s:test_file)
    elseif !exists("s:test_file")
      return
    end
endfunction

function! RunSpec(filename)
  call Run("rspec " . a:filename)
endfunction

function! RunTest(filename)
  call Run("ruby " . a:filename)
endfunction

function! RunFeature(filename)
  if isdirectory('features')
    call Run("cucumber " . a:filename)
  else
    call RunSpec(a:filename)
  end
endfunction

function! RunJasmineHeadlessFeature(filename)
  call Run("jasmine-headless-webkit -c" . a:filename)
endfunction

function! RunNearestTest()
  let s:line_number = ":" . line('.')
  call RunTestFile()
endfunction

function! RunTests()
  if isdirectory('test')
    call Run("rake test")
  else
    call Run("rspec spec")
  endif
endfunction

function! RunFeatures()
  if isdirectory('features')
    call Run("cucumber")
  else
    call Run("rspec spec/acceptance")
  endif
endfunction

function! Run(cmd)
  if exists('s:line_number')
    let command = a:cmd . s:line_number
    let s:line_number = ''
  else
    let command = a:cmd
  end

  if g:use_vimux
    call VimuxRunCommand("clear")
    call VimuxClearRunnerHistory()
    call VimuxRunCommand("time " . command)
  else
    silent exec ":!clear"
    silent exec ":!echo time: " . command
    exec ":!time " . command
  endif
endfunction
