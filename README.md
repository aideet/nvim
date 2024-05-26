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

