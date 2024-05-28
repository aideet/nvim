

vim.env.NNN_PLUG='o:fzopen;p:preview-tui;d:diffs'
vim.env.NNN_FIFO='/tmp/nnn.fifoi'
vim.env.NNN_FCOLORS='00000C48009393F7C4000000'
vim.env.NNN_TERMINAL='kitty'
vim.env.NNN_BMS="d:/home/dts/doc;w:/home/dts/dev/ws_dts;m:/home/dts/media/music;a:/home/dts/media/audibles:p:/home/dts/media/pics;v:/home/dts/media/video"

local options = {
    explorer = {
        cmd = "/home/dts/dev/nnn/nnn",       -- command override (-F1 flag is implied, -a flag is invalid!)
    },
    picker = {
        cmd = "/home/dts/dev/nnn/nnn",       -- command override (-F1 flag is implied, -a flag is invalid!)
    },
}

return options
