scriptencoding utf-8

" ultisnips {
  " Set ultisnips triggers
  let g:UltiSnipsSnippetDirectories=['UltiSnips']
  exe 'set rtp+=' . expand(g:spacevim_dir . '/private/UltiSnips')
"  let g:UltiSnipsSnippetsDir = [g:spacevim_dir.'/private/UltiSnips', g:spacevim_plug_home.'vim-snippets/UltiSnips/']
  let g:UltiSnipsSnippetsDir = g:spacevim_dir.'/private/UltiSnips'

" let g:UltiSnipsListSnippets = '<C-l>'
"  let g:UltiSnipsJumpForwardTrigger = '<C-j>'
"  let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif
if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif


au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

  " Fix tab conflict with YCM
"  let g:UltiSnipsExpandTrigger = '<C-e>'
"  let g:ulti_expand_or_jump_res = 0
"  function! ExpandSnippetOrCarriageReturn()
"    let l:snippet = UltiSnips#ExpandSnippetOrJump()
"    if g:ulti_expand_or_jump_res > 0
"      return l:snippet
"    else
"      return "\<CR>"
"    endif
"  endfunction
"  inoremap <expr> <CR> pumvisible() ? "\<C-R>=ExpandSnippetOrCarriageReturn()\<CR>" : "\<CR>"
" }
