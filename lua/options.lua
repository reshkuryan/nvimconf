local o = vim.opt

o.shiftwidth = 4 
o.expandtab = true
o.number = true
o.ignorecase = true
o.termguicolors = true
o.smartindent = true
o.packpath:append("~/.config/nvim/pack/vendor/start")

vim.cmd("colorscheme oxocarbon")
