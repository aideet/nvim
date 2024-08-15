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

Hit respective keybinding twice... if this does not work try `<C-w><C-w>`

### move text

    :m12    move current or selected lines after line 12
    :m0     move current or selected lines before first line
    :m$     move current or selected lines after last line
    :m'a    move current or selected lines after mark 'a
    :m'a-1  move current or selected lines before mark 'a

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

### save as root

    :w !sudo tee %

- :w – This is the write command. Since no argument is given, Vim will write the whole file to standard output.
- !sudo – Run the 'sudo' command as a shell command, not as a Vim command
- tee – The tee command is used to read from standard input and write it either to standard output or to a file
- % – Vim substitutes this by the name of the current file that you are editing.

### tabs vs spaces

Convert space to tabs

    :set noexpandtab
    :retab!

Convert tabs to spaces

    :set expandtab
    :set tabstop=4
    :set shiftwidth=4
    :retab

### insert at indent

insert line blow/above cursor

    :h o
    :h O

insert in current line

    S

### in- decrement numbers

put cursor on a number and `<C-a>` or `<C-x>` (or `g<C-a>` / `g<C-x>` for block selections)

