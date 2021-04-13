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

" Fzf
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-stand']
let g:ctrlp_use_caching=0

" YCM
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
nnoremap <Leader>grr :YcmCompleter RefactorRename<SPACE>
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

"Gfiles, rg, undotree, vim-fugitive
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <leader>pf :Rg<SPACE><c-r><c-w>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>b :Gblame<CR>

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

" Snippets
"let g:UltiSnipsExpandTrigger="<tab>"
