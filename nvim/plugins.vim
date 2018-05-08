" dein {{{
let s:dein_cache_dir = g:cache_home . '/dein'

" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

if &runtimepath !~# '/dein.vim'
    let s:dein_repo_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'

    " download
    if !isdirectory(s:dein_repo_dir)
        call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
    endif

    " read dein.vim as a plugin
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

" dein.vim settings
let g:dein#install_max_processes = 16
let g:dein#install_progress_type = 'title'
let g:dein#install_message_type = 'none'
let g:dein#enable_notification = 1

if dein#load_state(s:dein_cache_dir)
    call dein#begin(s:dein_cache_dir)

    let s:toml_dir = g:config_home . '/dein'

    call dein#load_toml(s:toml_dir . '/plugins.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/plugins_lazy.toml', {'lazy': 1})
    "if has('nvim')
    ""    call dein#load_toml(s:toml_dir . '/neovim.toml', {'lazy': 1})
    "endif

    "call dein#end()
    "call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif

" }}}

let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
    \ 'scala': ['node', expand('~/bin/sbt-server-stdio.js')]
    \ }

nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>

"let g:LanguageClient_diagnosticsEnable = 1

" let g:lsc_server_commands = {'scala': 'node /Users/eed3si9n/bin/sbt-server-stdio.js'}

" au User lsp_setup call lsp#register_server({
" \ 'name': 'sbt-server',
" \ 'cmd': { server_info->['node', '/Users/eed3si9n/bin/sbt-server-stdio.js']},
" \ 'whitelist': ['scala'],
" \ })


" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')

" run sbt first
" au User lsp_setup call lsp#register_server({
    " \ 'name': 'sbt-scala',
    " \ 'cmd': {server_info->['node', '/Users/eed3si9n/bin/sbt-server-stdio.js']},
    " \ 'whitelist': ['scala'],
    " \ })

