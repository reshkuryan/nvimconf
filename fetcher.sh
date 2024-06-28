#!/bin/bash

PLUGINS_DIR=~/.config/nvim/pack/vendor/start/

mkdir -p $PLUGINS_DIR

cd $PLUGINS_DIR

REPOS=(
  "hrsh7th/cmp-buffer"
  "hrsh7th/cmp-path"
  "hrsh7th/nvim-cmp"
  "nvim-lua/plenary.nvim"
  "hrsh7th/cmp-cmdline"
  "vigoux/fine-cmdline.nvim"
  "neovim/nvim-lspconfig"
  "nvim-telescope/telescope.nvim"
  "hrsh7th/cmp-nvim-lsp"
  "MunifTanjim/nui.nvim"
  "shaunsingh/oxocarbon.nvim"
  "wakatime/vim-wakatime"
)

BASE_URL="https://github.com/"

for repo in "${REPOS[@]}"
do
  git clone "${BASE_URL}${repo}.git"
done

echo "All repositories have been cloned."
