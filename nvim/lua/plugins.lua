-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use 'tanvirtin/monokai.nvim'
  use 'sainnhe/sonokai'
  -- use 'patstockwell/vim-monokai-tasty'
  use 'altercation/vim-colors-solarized'
  use 'nvim-treesitter/nvim-treesitter'
end)
