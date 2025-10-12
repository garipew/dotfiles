local vim = vim
local Plug = vim.fn['plug#']

vim.g.start_time = vim.fn.reltime()
vim.loader.enable()

vim.call('plug#begin')
Plug('uZer/pywal16.nvim')
vim.call('plug#end')

local pywal16 = require('pywal16')
pywal16.setup()
