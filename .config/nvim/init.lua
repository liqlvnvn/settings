-- Установите Packer, если он еще не установлен
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Менеджер плагинов
  use 'wbthomason/packer.nvim'

  use 'ishan9299/nvim-solarized-lua' -- Плагин Solarized
end)


vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = true

vim.opt.background = "light" -- Устанавливаем "light" для Solarized Light
vim.cmd.colorscheme('solarized') -- Устанавливаем тему Solarized
vim.opt.termguicolors = true

