call plug#begin('~/.config/nvim/plugged')

" Appearance
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'gruvbox-community/gruvbox'
Plug 'tomasr/molokai'
Plug 'gosukiwi/vim-atom-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'edkolev/tmuxline.vim'

" File find
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Completion
Plug 'Valloric/YouCompleteMe'
Plug 'lyuts/vim-rtags'
Plug 'vim-ruby/vim-ruby'
Plug 'ekalinin/dockerfile.vim'

" Format
Plug 'godlygeek/tabular'
Plug 'rhysd/vim-clang-format'
Plug 'Chiel92/vim-autoformat'

" Tasks
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'plasticboy/vim-markdown'

" Overload vimrc if in project
Plug 'dbakker/vim-projectroot'
Plug 'MarcWeber/vim-addon-local-vimrc'

" Tagbar
Plug 'liuchengxu/vista.vim'
Plug 'preservim/tagbar'

" NERDTree
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

"Git
Plug 'tpope/vim-fugitive'               " Git
Plug 'tpope/vim-rhubarb'                " Gbrowse
Plug 'shumphrey/fugitive-gitlab.vim'    " Gbrowse gitlab support
Plug 'airblade/vim-gitgutter'           " Gutter

Plug 'tpope/vim-eunuch'                 " Shell commands
Plug 'tpope/vim-commentary'             " Comments
Plug 'tpope/vim-surround'               " Surround words with parenthese etc.
Plug 'leafgarland/typescript-vim'       " Typescript
Plug 'vim-utils/vim-man'                " Manual
Plug 'vimwiki/vimwiki'                  " Notes
Plug 'tomtom/tlib_vim'                  " Utility functions, dependancy
Plug 'vim-scripts/DoxygenToolkit.vim'   " Doxygen
Plug 'lervag/vimtex'                    " Latex compiler
Plug 'szw/vim-maximizer'                " Window maximizer, like tmux zoom
Plug 'MarcWeber/vim-addon-mw-utils'     " Dependancy?
Plug 'mg979/vim-visual-multi'			" Multi cursosr
Plug 'wellle/targets.vim'               " Extended targets, like ci'
" Plug 'vim-ctrlspace/vim-ctrlspace'      " Workspaces, bookmarks, files...

" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'ervandew/supertab'
" Plug 'garbas/vim-snipmate'
" Plug 'dbeniamine/cheat.sh-vim'
" Debugger plugins
" Plug 'puremourning/vimspector'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'ludovicchabant/vim-gutentags'

call plug#end()
