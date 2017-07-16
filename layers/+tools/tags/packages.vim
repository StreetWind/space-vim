if executable('ctags')
  MP 'majutsushi/tagbar'
  MP 'dimonomid/vim-indexer'
  MP 'dimonomid/vim-vimprj'
  MP 'dimonomid/vim-dfrank-util'
endif
if executable('cscope') && has('cscope')
  MP 'StreetWind/vim-auto-cscope'
endif
