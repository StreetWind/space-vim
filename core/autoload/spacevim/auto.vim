function!  spacevim#auto#AddTitle()
  if &filetype == 'sh'
    call setline(1,'#!/usr/bin/env bash')
    call append(line('.'), '')
  elseif &filetype == 'python'
    call setline(1,'#!/usr/bin/env python')
    call append(line('.'), '# -*- coding: utf-8 -*-')
    call append(line('.')+1, '')
  elseif &filetype == 'ruby'
    call setline(1,'#!/usr/bin/env ruby')
    call append(line('.'), '# encoding: utf-8')
    call append(line('.')+1, '')
  elseif &filetype == 'cpp'
    call setline(1, '#include <iostream>')
    call append(line('.'), 'using namespace std;')
    call append(line('.')+1, '')
  elseif &filetype == 'c'
    call setline(1, '#include <stdio.h>')
    call append(line('.'), '')
  elseif &filetype == 'perl'
    call setline(1, '#!/usr/bin/perl')
    call append(line('.')+0, 'use strict;')
    call append(line('.')+1, 'use warnings;')
    call append(line('.')+2, 'use utf8;')
    call append(line('.')+3, '')
  elseif &filetype == 'markdown'
    call setline(1,'---')
    call append(line('.')+0,'layout: ')
    call append(line('.')+1,'title: ')
    call append(line('.')+2,'date: '. strftime("%Y-%m-%d %H:%M:%S"))
    call append(line('.')+3,'updated: ' . strftime("%Y-%m-%d %H:%M:%S"))
    call append(line('.')+4,'comments: ')
    call append(line('.')+5,'tags: ')
    call append(line('.')+6,'categories: ')
    call append(line('.')+7,'---')    
  endif
endfunction

" go
" run :GoBuild or :GoTestCompile based on the go file, refer to
" vim-go-tutorial
function! spacevim#auto#BuildGoFiles()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
