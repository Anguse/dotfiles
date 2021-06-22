" Asynctasks
let g:asyncrun_open = 6
let g:asynctasks_term_rows = 40 " set height for the horizontal terminal split
let g:asynctasks_term_pos = 'external'
nnoremap <F2> :AsyncTask task1<CR>
nnoremap <F3> :AsyncTask task2<CR>
nnoremap <F4> :AsyncTask task3<CR>
nnoremap <F5> :AsyncTask task4<CR>

" Airline
let g:airline_powerline_fonts = 1

" YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
nnoremap <Leader>grr :YcmCompleter RefactorRename<SPACE>
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

"Fugitive
nnoremap <leader>b :Gblame<CR>

" Telecope
nnoremap <C-p> :Telescope find_files<cr>
nnoremap <leader>ps :Telescope live_grep<cr>
nnoremap <leader>pf :Telescope grep_string<CR>

" Gutter
let g:gitgutter_enabled = 0
nmap <F7> :GitGutterToggle<CR>
nnoremap <leader>gg :GitGutterQuickFix<bar> :copen<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>
nmap <F9> :TagbarCurrentTag<CR>

" Doxygen
let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="-------------------------------"
let g:DoxygenToolkit_blockFooter="---------------------------------"
let g:DoxygenToolkit_authorName="Harald Lilja"
let g:DoxygenToolkit_licenseTag="My own license" 

" vim-maximizer
nnoremap <leader>z :MaximizerToggle <CR>

" vim-ripgrep
if executable('rg')
    let g:rg_derive_root='true'
endif

" clang-format
let g:clang_format#detect_style_file=1

" Nerdtree
nnoremap <leader>pv :NERDTreeFind<CR>

" Snippets
"let g:UltiSnipsExpandTrigger="<tab>"
