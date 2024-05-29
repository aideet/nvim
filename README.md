# NeoVim configuration

## dap

### rust

Install lldb:

    pacman -S lldb

## Tips

### macros

start record: `q{letter}` 

stop  record: `q` 

execute: ` @{letter}` 

execute again: `@@` 

### commands in insert mode

    <C-o>

### jump in to floating windows

Hit respective keybinding twice... if this does not work try `<C-w><C-w>'

### search-pattern movements

    {command}/{search-pattern}/{search-offset}

eg:

    v/goofy
    v/goofe/e

[search-offset](https://vimhelp.org/pattern.txt.html#search-offset)


### select next search

    h: gn

### repeat last substitute

    h: &

### text object selection

    h: aw

### up down in wrapped lines

    h: gk
    h: gj

### in- decrement numbers

put cursor on a number and `<C-a>` or `<C-x>` (or `g<C-a>` / `g<C-x>` for block selections)

