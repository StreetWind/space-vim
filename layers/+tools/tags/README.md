# tags layer
------
## tags load

<!-- vim-markdown-toc GFM -->
* [Description](#description)
* [Install](#install)
    * [Dependencies](#Dependencies)
        * [Ctags](#ctags)
        * [Cscope](#cscope)
* [Key Bindings](#key-bindings)

<!-- vim-markdown-toc -->

## Description

This layer adds support for the painless text alignment.


## Install

To use this configuration layer, add it to your `~/.spacevim`.

## Dependencies
### Ctags
```C++
   Ubuntu
      sudo apt-get install ctags
```
### Cscope
```C++
   Ubunt
   sudo apt-get install cscope
```

## Key Bindings

Key Binding         | Mode           | Description
:---:               | :---:          | :---:
<kbd>C-s    </kbd>  | Normal, Visual | Find this C symbol
<kbd>C-j    </kbd>  | Normal, Visual | Find this definition
<kbd>C-d     </kbd> | Normal, Visual | Find functions called by this function
<kbd>C-c    </kbd>  | Normal, Visual | Find functions calling this function
<kbd>C-t    </kbd>  | Normal, Visual | Find this text string
<kbd>C-e     </kbd> | Normal, Visual | Find this egrep pattern
<kbd>C-f    </kbd>  | Normal, Visual | Find this file
<kbd>C-g g   </kbd> | Normal, Visual | Find files #including this file
<kbd>F8      </kbd> | Normal, Visual | Open TagbrToggle
<kbd>F9     </kbd>  | Normal, Visual | auto make tags config

