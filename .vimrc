let mapleader = ","
set ts=2
set bs=2
set shiftwidth=2
set number
set ruler
set columns=999
set lines=999
set nowrap
set cursorline
:colorscheme vividchalk
set noerrorbells
set laststatus=2
set backup
set backupdir=~/.vim/backups
set directory=~/.vim/tmp
set showcmd " This shows what you are typing as a command.  I love this!
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
" obvious custom mappings
command! Rfactories :Redit test/factories/factories.rb
command! RVfactories :RVedit test/factories/factories.rb
command! RTfactories :RTedit test/factories/factories.rb
command! Rschema :Redit db/schema.rb
command! RVschema :RVedit db/schema.rb
command! RTschema :RTedit db/schema.rb
command! Rstylesheet :Redit assets/stylesheets/applicaiton.css
command! RVstylesheet :RVedit assets/stylesheets/applicaiton.css
command! RTstylesheet :RTedit assets/stylesheets/applicaiton.css
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set showmatch
set ignorecase smartcase  " make searches case-sensitive only if they contain upper-case characters

" highlight the trailing whitespace on opening the buffer and leaving the insert mode.
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
" Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
" Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif

"for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
  autocmd! BufRead,BufNewFile *.sass setfiletype sass

augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>
" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>
" resize the vertical split easlier
nnoremap <silent> <c-p> 20<c-W>>
nnoremap <silent> <c-o> 20<c-W><


nnoremap <leader>a :Ack -a


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>


" funkyness below as per tpope post to deal with pathogen load issues
set nocp
call pathogen#infect()
syntax on
filetype plugin indent on
call pathogen#infect()
" below allows for indenting a file and puts cursor back where you were
map   <silent> <F5> mmgg=G'm
imap  <silent> <F5> <Esc> mmgg=G'm
" preserve highlight in visual mode when indenting
:vmap < <gv
:vmap > >gv
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPS TO JUMP TO SPECIFIC COMMAND-T TARGETS AND FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>t :CommandTFlush<cr>\|:CommandT<cr>
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets<cr>
