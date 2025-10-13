local vim = vim
local Plug = vim.fn['plug#']

vim.g.start_time = vim.fn.reltime()
-- vim.loader.enable()

vim.call('plug#begin')
Plug('uZer/pywal16.nvim')
vim.call('plug#end')

local pywal16 = require('pywal16')
pywal16.setup()

vim.cmd("syntax enable")

-- Relative numbers for crazy jumps!!!
vim.opt.relativenumber = true
vim.opt.number = true

-- incremental search ftw
vim.opt.incsearch = true

-- Center cursor after half-page jump
vim.keymap.set('n', '<C-d>', '<C-d>zz', {noremap=true, silent=true})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {noremap=true, silent=true})

-- Buffer stuff, may be useful later
vim.keymap.set('n', '<M-l>', ':bn<CR>', {noremap=true, silent=true})
vim.keymap.set('n', '<M-h>', ':bp<CR>', {noremap=true, silent=true})

-- Man page on tmux pane!!!
vim.keymap.set('n', 'K', function()
	local word = vim.fn.expand('<cword>')
	if os.getenv("TMUX") ~= nil then
		vim.fn.system("tmux split-window -h 'man " .. word .. "'")
	else
		vim.cmd("!man " .. word)
	end
end)


-- LSP stuff
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'lua',
	callback = function(ev)
		vim.lsp.start({
			name = 'luals',
			cmd = {'lua-language-server'},
			root_dir = vim.fs.root(ev.buf, {'.git'}),
		})
	end,
})
