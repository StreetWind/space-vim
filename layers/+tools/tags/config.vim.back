let s:is_win = has('win32') || has('win64')
let s:vimtagsname ='.vimtags'
let g:vimprj_dirNameForSearch = s:vimtagsname
let s:vimworkPath=getcwd()
let s:vimprjPath =getcwd().'/'.s:vimtagsname
let s:indexerFilenName =s:vimprjPath.'/.indexer_files'
let g:csFileEx = ['*.c','*.h']

function! s:autotagsconfig()
if executable('ctags')
  if !isdirectory(s:vimprjPath)
    call s:system((s:is_win? 'md ' : 'mkdir ') . s:shellesc(s:vimprjPath))
    call s:system((s:is_win? 
          \printf('echo [%s] > %s && echo $VIMPRJ_PROJECT_ROOT >> %s','%dir_name(..)%',s:vimworkPath,s:shellesc(s:indexerFilenName)):
          \printf('echo "[%s]"\\n"%s" > %s','%dir_name(..)%',s:vimworkPath,s:shellesc(s:indexerFilenName))))
  else
    call s:rm_rf(s:vimprjPath)
    call s:autotagsconfig()
    return
  endif
  let g:indexer_indexerListFilename  = s:searchworkdir().'/indexer_files'
endif
endfunction

function! s:shellesc(arg)
  return '"'.escape(a:arg, '"').'"'
endfunction

function! s:rm_rf(dir)
  if isdirectory(a:dir)
    call s:system((s:is_win ? 'rmdir /S /Q ' : 'rm -rf ') . s:shellesc(a:dir))
  endif
endfunction

function! s:with_cd(cmd, dir)
  return printf('cd%s %s && %s', s:is_win ? ' /d' : '', s:shellesc(a:dir), a:cmd)
endfunction

function! s:system(cmd, ...)
  try
    let [sh, shrd] = [&shell,&shellredir]
    if !s:is_win && 1
       set shell=sh shellredir=>%s\ 2>&1
    endif
    let cmd = a:0 > 0 ? s:with_cd(a:cmd, a:1) : a:cmd
    "echo cmd
    return system(s:is_win ? '('.cmd.')' : cmd)
  finally
    let [&shell, &shellredir] = [sh, shrd]
  endtry
endfunction

function! s:searchworkdir()
  let s:indexerwork=finddir(s:vimtagsname,s:vimworkPath.';',0)
  if len(s:indexerwork) ==len(s:vimtagsname)
    return s:vimworkPath.'/'.s:vimtagsname
  elseif len(s:indexerwork)>len(s:vimtagsname)
    return s:indexerwork
  else
    return ''
  endif
endfunction
let tagbar_left=0 
let g:tagbar_compact=1
let tagbar_width=25
let g:indexer_indexerListFilename  = s:searchworkdir().'/.indexer_files'
let g:autocscopepath =s:searchworkdir()
let g:indexer_disableCtagsWarning=1
let g:cscope_open_location=0
if executable('cscope')
  " s: Find this C symbol
  nnoremap  <C-s> :call CscopeFind('s', expand('<cword>'))<CR>
  " g: Find this definition
  nnoremap  <C-j> :call CscopeFind('g', expand('<cword>'))<CR> 
  " d: Find functions called by this function
  nnoremap  <C-d> :call CscopeFind('d', expand('<cword>'))<CR>
  " c: Find functions calling this function
  nnoremap  <C-c> :call CscopeFind('c', expand('<cword>'))<CR>
  " t: Find this text string
  nnoremap  <C-t> :call CscopeFind('t', expand('<cword>'))<CR>
  " e: Find this egrep pattern
  nnoremap  <C-e> :call CscopeFind('e', expand('<cword>'))<CR>
  " f: Find this file
  nnoremap  <C-f> :call CscopeFind('f', expand('<cword>'))<CR>
  " i: Find files #including this file
  nnoremap  <C-g>g :call CscopeFind('i', expand('<cword>'))<CR>
endif

nnoremap <F9> :call <SID>autotagsconfig()<CR>

if executable('ctags')
  nnoremap <F8> :TagbarToggle<CR>
endif


