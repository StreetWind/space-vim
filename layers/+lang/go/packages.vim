if g:spacevim.timer
  MP 'fatih/vim-go', { 'on': [], 'do': ':GoInstallBinaries' }
  MP 'mdempsky/gocode', { 'on': '[]', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
else
  MP 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
  MP 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
endif
autocmd! User vim-go call spacevim#autocmd#go#Init()
