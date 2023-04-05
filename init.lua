vim.opt.encoding='utf-8'
vim.opt.fileformat='unix'
vim.g.mapleader=" "
require('impatient')

-- FIXME: foo
-- FIX: foo
-- WARN: foo
-- BUG: foo
-- XXX: foo
-- HACK: foo
-- NOTE: foo
-- TEST: foo
-- TODO: foo
vim.cmd('source C:/Users/pme/AppData/Local/nvim-data/init.vim')
require('plugins')
require('plugin_conf')
require('keymaps')

vim.cmd("colorscheme kanagawa")
vim.opt.guifont = {"Hack NFM:h12"}

vim.opt.smartcase=true
vim.opt.smarttab=true
vim.opt.smartindent=true

vim.cmd([[let &shell = '"C:/Program Files/Git/bin/bash.exe"']])
