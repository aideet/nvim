

vim.env.NNN_PLUG='f:finder;o:fzopen;p:preview-tui;d:diffs;t:nmount;v:imgview'
vim.env.NNN_FIFO='/tmp/nnn.fifoi'
vim.env.NNN_FCOLORS='00006f310000000000000000'
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
