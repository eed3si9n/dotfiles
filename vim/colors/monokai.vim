" monokai.vim - Vimscript port of monokai.nvim
" Works in Vim 8+ and Neovim.
"
" Install:  ~/.vim/colors/monokai.vim   (Neovim: ~/.config/nvim/colors/)
" Use:      colorscheme monokai
"
" Options (set these BEFORE :colorscheme):
"   let g:monokai_palette = 'classic'   " 'classic' | 'pro' | 'soda' | 'ristretto', or your own dict
"   let g:monokai_italics = 1           " 0 to disable italics
"   let g:monokai_custom_hlgroups = {
"         \ 'Comment': {'fg': '#888888', 'style': 'italic'},
"         \ }

hi clear
if exists('syntax_on')
  syntax reset
endif
set background=dark
if has('termguicolors')
  set termguicolors
endif
let g:colors_name = 'monokai'

" ---------------------------------------------------------------------------
" Palettes
" ---------------------------------------------------------------------------
let s:palettes = {}

let s:palettes.classic = {
      \ 'name': 'monokai',
      \ 'base0': '#222426', 'base1': '#272a30', 'base2': '#26292C',
      \ 'base3': '#2E323C', 'base4': '#333842', 'base5': '#4d5154',
      \ 'base6': '#9ca0a4', 'base7': '#b1b1b1', 'base8': '#e3e3e1',
      \ 'border': '#a1b5b1', 'brown': '#504945', 'white': '#f8f8f0',
      \ 'grey': '#8F908A', 'black': '#000000', 'pink': '#f92672',
      \ 'green': '#a6e22e', 'aqua': '#66d9ef', 'yellow': '#e6db74',
      \ 'orange': '#fd971f', 'purple': '#ae81ff', 'red': '#e95678',
      \ 'diff_add': '#3d5213', 'diff_remove': '#4a0f23',
      \ 'diff_change': '#27406b', 'diff_text': '#23324d',
      \ }

let s:palettes.pro = {
      \ 'name': 'monokai_pro',
      \ 'base0': '#222426', 'base1': '#211F22', 'base2': '#26292C',
      \ 'base3': '#2E323C', 'base4': '#333842', 'base5': '#4d5154',
      \ 'base6': '#72696A', 'base7': '#B1B1B1', 'base8': '#e3e3e1',
      \ 'border': '#A1B5B1', 'brown': '#504945', 'white': '#FFF1F3',
      \ 'grey': '#72696A', 'black': '#000000', 'pink': '#FF6188',
      \ 'green': '#A9DC76', 'aqua': '#78DCE8', 'yellow': '#FFD866',
      \ 'orange': '#FC9867', 'purple': '#AB9DF2', 'red': '#FD6883',
      \ 'diff_add': '#3d5213', 'diff_remove': '#4a0f23',
      \ 'diff_change': '#27406b', 'diff_text': '#23324d',
      \ }

let s:palettes.soda = {
      \ 'name': 'monokai_soda',
      \ 'base0': '#222426', 'base1': '#211F22', 'base2': '#26292C',
      \ 'base3': '#2E323C', 'base4': '#333842', 'base5': '#4d5154',
      \ 'base6': '#72696A', 'base7': '#B1B1B1', 'base8': '#e3e3e1',
      \ 'border': '#A1B5B1', 'brown': '#504945', 'white': '#f6f6ec',
      \ 'grey': '#72696A', 'black': '#000000', 'pink': '#f3005f',
      \ 'green': '#97e023', 'aqua': '#78DCE8', 'yellow': '#dfd561',
      \ 'orange': '#fa8419', 'purple': '#9c64fe', 'red': '#f3005f',
      \ 'diff_add': '#3d5213', 'diff_remove': '#4a0f23',
      \ 'diff_change': '#27406b', 'diff_text': '#23324d',
      \ }

let s:palettes.ristretto = {
      \ 'name': 'monokai_ristretto',
      \ 'base0': '#191515', 'base1': '#211c1c', 'base2': '#2c2525',
      \ 'base3': '#403838', 'base4': '#5b5353', 'base5': '#72696a',
      \ 'base6': '#8c8384', 'base7': '#c3b7b8', 'base8': '#fff1f3',
      \ 'border': '#A1B5B1', 'brown': '#352e2e', 'white': '#fff1f3',
      \ 'grey': '#72696a', 'black': '#000000', 'pink': '#FF6188',
      \ 'green': '#adda78', 'aqua': '#85dacc', 'yellow': '#f9cc6c',
      \ 'orange': '#f38d70', 'purple': '#a8a9eb', 'red': '#fd6883',
      \ 'diff_add': '#527728', 'diff_remove': '#842335',
      \ 'diff_change': '#247c6e', 'diff_text': '#23324d',
      \ }

" ---------------------------------------------------------------------------
" Config
" ---------------------------------------------------------------------------
let s:choice = get(g:, 'monokai_palette', 'classic')
if type(s:choice) == v:t_dict
  let s:p = extend(copy(s:palettes.classic), s:choice)
else
  let s:p = get(s:palettes, s:choice, s:palettes.classic)
endif
let s:italics = get(g:, 'monokai_italics', 1)
let s:custom = get(g:, 'monokai_custom_hlgroups', {})
let s:seen = {}

" ---------------------------------------------------------------------------
" Highlighter
" spec keys: fg, bg, sp, style  (all optional)
" ---------------------------------------------------------------------------
function! s:hi(group, spec) abort
  let s:seen[a:group] = 1
  let l:spec = a:spec
  if has_key(s:custom, a:group)
    let l:spec = extend(copy(a:spec), s:custom[a:group])
  endif
  let l:style = get(l:spec, 'style', 'NONE')
  if l:style ==# 'italic' && !s:italics
    let l:style = 'NONE'
  endif
  " cterm= is set too: Vim uses cterm attributes in the terminal,
  " even with termguicolors on.
  let l:cmd = 'highlight ' . a:group
        \ . ' gui=' . l:style . ' cterm=' . l:style
        \ . ' guifg=' . get(l:spec, 'fg', 'NONE')
        \ . ' guibg=' . get(l:spec, 'bg', 'NONE')
  if has_key(l:spec, 'sp')
    let l:cmd .= ' guisp=' . l:spec.sp
  endif
  execute l:cmd
endfunction

let s:P = s:p

" ---------------------------------------------------------------------------
" Editor / syntax groups
" ---------------------------------------------------------------------------
call s:hi('Normal',          {'fg': s:P.white, 'bg': s:P.base2})
call s:hi('NormalFloat',     {'bg': s:P.base1})
call s:hi('Pmenu',           {'fg': s:P.white, 'bg': s:P.base3})
call s:hi('PmenuSel',        {'fg': s:P.base4, 'bg': s:P.orange})
call s:hi('PmenuSelBold',    {'fg': s:P.base4, 'bg': s:P.orange})
call s:hi('PmenuThumb',      {'fg': s:P.purple, 'bg': s:P.green})
call s:hi('PmenuSbar',       {'bg': s:P.base3})
call s:hi('Cursor',          {'style': 'reverse'})
call s:hi('ColorColumn',     {'bg': s:P.base3})
call s:hi('CursorLine',      {'bg': s:P.base3})
call s:hi('NonText',         {'fg': s:P.base5})
call s:hi('Visual',          {'bg': s:P.base4})
call s:hi('VisualNOS',       {'bg': s:P.base3})
call s:hi('Search',          {'fg': s:P.base2, 'bg': s:P.yellow})
call s:hi('IncSearch',       {'fg': s:P.base2, 'bg': s:P.orange})
call s:hi('CursorLineNr',    {'fg': s:P.orange, 'bg': s:P.base2})
call s:hi('MatchParen',      {'fg': s:P.pink})
call s:hi('Question',        {'fg': s:P.yellow})
call s:hi('ModeMsg',         {'fg': s:P.white, 'style': 'bold'})
call s:hi('MoreMsg',         {'fg': s:P.white, 'style': 'bold'})
call s:hi('ErrorMsg',        {'fg': s:P.red, 'style': 'bold'})
call s:hi('WarningMsg',      {'fg': s:P.yellow, 'style': 'bold'})
call s:hi('VertSplit',       {'fg': s:P.brown})
call s:hi('LineNr',          {'fg': s:P.base5, 'bg': s:P.base2})
call s:hi('SignColumn',      {'fg': s:P.white, 'bg': s:P.base2})
call s:hi('StatusLine',      {'fg': s:P.base7, 'bg': s:P.base3})
call s:hi('StatusLineNC',    {'fg': s:P.grey, 'bg': s:P.base3})
call s:hi('TabLine',         {})
call s:hi('TabLineFill',     {})
call s:hi('TabLineSel',      {'bg': s:P.base4})
call s:hi('SpellBad',        {'fg': s:P.red, 'style': 'undercurl'})
call s:hi('SpellCap',        {'fg': s:P.purple, 'style': 'undercurl'})
call s:hi('SpellRare',       {'fg': s:P.aqua, 'style': 'undercurl'})
call s:hi('SpellLocal',      {'fg': s:P.pink, 'style': 'undercurl'})
call s:hi('SpecialKey',      {'fg': s:P.pink})
call s:hi('Title',           {'fg': s:P.yellow, 'style': 'bold'})
call s:hi('Directory',       {'fg': s:P.aqua})
call s:hi('DiffAdd',         {'bg': s:P.diff_add})
call s:hi('DiffDelete',      {'bg': s:P.diff_remove})
call s:hi('DiffChange',      {'bg': s:P.diff_change})
call s:hi('DiffText',        {'bg': s:P.diff_text})
call s:hi('diffAdded',       {'fg': s:P.green})
call s:hi('diffRemoved',     {'fg': s:P.pink})
call s:hi('Folded',          {'fg': s:P.grey, 'bg': s:P.base3})
call s:hi('FoldColumn',      {'fg': s:P.white, 'bg': s:P.black})
call s:hi('Constant',        {'fg': s:P.aqua})
call s:hi('Number',          {'fg': s:P.purple})
call s:hi('Float',           {'fg': s:P.purple})
call s:hi('Boolean',         {'fg': s:P.purple})
call s:hi('Character',       {'fg': s:P.yellow})
call s:hi('String',          {'fg': s:P.yellow})
call s:hi('Type',            {'fg': s:P.aqua})
call s:hi('Structure',       {'fg': s:P.aqua})
call s:hi('StorageClass',    {'fg': s:P.aqua})
call s:hi('Typedef',         {'fg': s:P.aqua})
call s:hi('Identifier',      {'fg': s:P.white})
call s:hi('Function',        {'fg': s:P.green, 'style': 'italic'})
call s:hi('Statement',       {'fg': s:P.pink})
call s:hi('Operator',        {'fg': s:P.pink})
call s:hi('Label',           {'fg': s:P.pink})
call s:hi('Keyword',         {'fg': s:P.pink, 'style': 'italic'})
call s:hi('PreProc',         {'fg': s:P.green})
call s:hi('Include',         {'fg': s:P.aqua, 'style': 'italic'})
call s:hi('Define',          {'fg': s:P.pink})
call s:hi('Macro',           {'fg': s:P.pink})
call s:hi('PreCondit',       {'fg': s:P.pink})
call s:hi('Special',         {'fg': s:P.white})
call s:hi('SpecialChar',     {'fg': s:P.pink})
call s:hi('Delimiter',       {'fg': s:P.white})
call s:hi('SpecialComment',  {'fg': s:P.grey, 'style': 'italic'})
call s:hi('Tag',             {'fg': s:P.orange})
call s:hi('Todo',            {'fg': s:P.orange})
call s:hi('Comment',         {'fg': s:P.base6, 'style': 'italic'})
call s:hi('Underlined',      {'style': 'underline'})
call s:hi('Ignore',          {})
call s:hi('Error',           {'fg': s:P.red})
call s:hi('Terminal',        {'fg': s:P.white, 'bg': s:P.base2})
call s:hi('EndOfBuffer',     {'fg': s:P.base2})
call s:hi('Conceal',         {'fg': s:P.grey})
call s:hi('vCursor',         {'style': 'reverse'})
call s:hi('iCursor',         {'style': 'reverse'})
call s:hi('lCursor',         {'style': 'reverse'})
call s:hi('CursorIM',        {'style': 'reverse'})
call s:hi('CursorColumn',    {'bg': s:P.base3})
call s:hi('Whitespace',      {'fg': s:P.base5})
call s:hi('WildMenu',        {'fg': s:P.white, 'bg': s:P.orange})
call s:hi('QuickFixLine',    {'fg': s:P.purple, 'style': 'bold'})
call s:hi('Debug',           {'fg': s:P.orange})
call s:hi('debugBreakpoint', {'fg': s:P.base2, 'bg': s:P.red})
call s:hi('Conditional',     {'fg': s:P.pink})
call s:hi('Repeat',          {'fg': s:P.pink})
call s:hi('Exception',       {'fg': s:P.pink})

" Plugin groups that also exist in Vim
call s:hi('dbui_tables',     {'fg': s:P.white})
call s:hi('CursorWord0',     {'fg': s:P.black, 'bg': s:P.white})
call s:hi('CursorWord1',     {'fg': s:P.black, 'bg': s:P.white})

" ---------------------------------------------------------------------------
" Neovim-only: Tree-sitter captures, diagnostics, and Lua plugins.
" Vim doesn't allow '@' in group names, so these are skipped there.
" ---------------------------------------------------------------------------
if has('nvim')
  call s:hi('@annotation',              {'fg': s:P.green})
  call s:hi('@attribute',               {'fg': s:P.green})
  call s:hi('@boolean',                 {'fg': s:P.purple})
  call s:hi('@character',               {'fg': s:P.yellow})
  call s:hi('@character.special',       {'fg': s:P.purple})
  call s:hi('@comment',                 {'fg': s:P.base6, 'style': 'italic'})
  call s:hi('@conceal',                 {'fg': s:P.grey})
  call s:hi('@conditional',             {'fg': s:P.pink})
  call s:hi('@conditional.ternary',     {'fg': s:P.pink})
  call s:hi('@constant',                {'fg': s:P.aqua})
  call s:hi('@constant.builtin',        {'fg': s:P.purple})
  call s:hi('@constant.macro',          {'fg': s:P.purple})
  call s:hi('@constructor',             {'fg': s:P.aqua})
  call s:hi('@debug',                   {'fg': s:P.pink})
  call s:hi('@define',                  {'fg': s:P.aqua})
  call s:hi('@definition',              {'fg': s:P.green})
  call s:hi('@definition.associated',   {'fg': s:P.green})
  call s:hi('@definition.constant',     {'fg': s:P.green})
  call s:hi('@definition.enum',         {'fg': s:P.green})
  call s:hi('@definition.field',        {'fg': s:P.green})
  call s:hi('@definition.function',     {'fg': s:P.green})
  call s:hi('@definition.import',       {'fg': s:P.white})
  call s:hi('@definition.macro',        {'fg': s:P.green})
  call s:hi('@definition.method',       {'fg': s:P.green})
  call s:hi('@definition.namespace',    {'fg': s:P.white})
  call s:hi('@definition.parameter',    {'fg': s:P.orange})
  call s:hi('@definition.type',         {'fg': s:P.green})
  call s:hi('@definition.var',          {'fg': s:P.green})
  call s:hi('@error',                   {'fg': s:P.red})
  call s:hi('@exception',               {'fg': s:P.pink})
  call s:hi('@field',                   {'fg': s:P.white})
  call s:hi('@float',                   {'fg': s:P.purple})
  call s:hi('@function',                {'fg': s:P.green, 'style': 'italic'})
  call s:hi('@function.builtin',        {'fg': s:P.aqua})
  call s:hi('@function.call',           {'fg': s:P.white})
  call s:hi('@function.macro',          {'fg': s:P.green, 'style': 'italic'})
  call s:hi('@include',                 {'fg': s:P.aqua, 'style': 'italic'})
  call s:hi('@keyword',                 {'fg': s:P.pink, 'style': 'italic'})
  call s:hi('@keyword.function',        {'fg': s:P.aqua, 'style': 'italic'})
  call s:hi('@keyword.operator',        {'fg': s:P.pink})
  call s:hi('@keyword.return',          {'fg': s:P.pink})
  call s:hi('@label',                   {'fg': s:P.pink})
  call s:hi('@math',                    {'fg': s:P.yellow})
  call s:hi('@method',                  {'fg': s:P.green})
  call s:hi('@method.call',             {'fg': s:P.white})
  call s:hi('@namespace',               {'fg': s:P.purple})
  call s:hi('@number',                  {'fg': s:P.purple})
  call s:hi('@operator',                {'fg': s:P.pink})
  call s:hi('@parameter',               {'fg': s:P.orange})
  call s:hi('@parameter.reference',     {'fg': s:P.white})
  call s:hi('@preproc',                 {'fg': s:P.green})
  call s:hi('@property',                {'fg': s:P.white})
  call s:hi('@punctuation.bracket',     {'fg': s:P.white})
  call s:hi('@punctuation.delimiter',   {'fg': s:P.white})
  call s:hi('@punctuation.special',     {'fg': s:P.pink})
  call s:hi('@reference',               {'fg': s:P.white})
  call s:hi('@repeat',                  {'fg': s:P.pink})
  call s:hi('@scope',                   {'fg': s:P.white})
  call s:hi('@storageclass',            {'fg': s:P.aqua})
  call s:hi('@storageclass.lifetime',   {'fg': s:P.aqua})
  call s:hi('@strike',                  {'fg': s:P.grey})
  call s:hi('@string',                  {'fg': s:P.yellow})
  call s:hi('@string.escape',           {'fg': s:P.purple})
  call s:hi('@string.regex',            {'fg': s:P.purple})
  call s:hi('@string.special',          {'fg': s:P.purple})
  call s:hi('@symbol',                  {'fg': s:P.purple})
  call s:hi('@tag',                     {'fg': s:P.pink})
  call s:hi('@tag.attribute',           {'fg': s:P.green})
  call s:hi('@tag.delimiter',           {'fg': s:P.white})
  call s:hi('@text',                    {'fg': s:P.green})
  call s:hi('@text.danger',             {'fg': s:P.red, 'style': 'bold'})
  call s:hi('@text.diff.add',           {'fg': s:P.diff_add})
  call s:hi('@text.diff.delete',        {'fg': s:P.diff_remove})
  call s:hi('@text.emphasis',           {'style': 'bold'})
  call s:hi('@text.environment',        {'fg': s:P.purple})
  call s:hi('@text.environment.name',   {'fg': s:P.aqua})
  call s:hi('@text.literal',            {'fg': s:P.yellow})
  call s:hi('@text.math',               {'fg': s:P.yellow})
  call s:hi('@text.note',               {'fg': s:P.aqua, 'style': 'bold'})
  call s:hi('@text.quote',              {'fg': s:P.grey})
  call s:hi('@text.reference',          {'fg': s:P.orange, 'style': 'italic'})
  call s:hi('@text.strike',             {'fg': s:P.grey})
  call s:hi('@text.strong',             {'style': 'bold'})
  call s:hi('@text.title',              {'fg': s:P.yellow, 'style': 'bold'})
  call s:hi('@text.todo',               {'fg': s:P.aqua})
  call s:hi('@text.underline',          {'style': 'underline'})
  call s:hi('@text.uri',                {'fg': s:P.aqua, 'style': 'underline'})
  call s:hi('@text.warning',            {'fg': s:P.yellow, 'style': 'bold'})
  call s:hi('@todo',                    {'fg': s:P.aqua})
  call s:hi('@type',                    {'fg': s:P.aqua})
  call s:hi('@type.builtin',            {'fg': s:P.aqua})
  call s:hi('@type.definition',         {'fg': s:P.aqua})
  call s:hi('@type.qualifier',          {'fg': s:P.pink})
  call s:hi('@uri',                     {'fg': s:P.aqua, 'style': 'underline'})
  call s:hi('@variable',                {'fg': s:P.white})
  call s:hi('@variable.builtin',        {'fg': s:P.orange})

  " Diagnostics
  call s:hi('DiagnosticSignError',        {'fg': s:P.red})
  call s:hi('DiagnosticSignWarn',         {'fg': s:P.yellow})
  call s:hi('DiagnosticSignInfo',         {'fg': s:P.white})
  call s:hi('DiagnosticSignHint',         {'fg': s:P.aqua})
  call s:hi('DiagnosticVirtualTextError', {'fg': s:P.red})
  call s:hi('DiagnosticVirtualTextWarn',  {'fg': s:P.yellow})
  call s:hi('DiagnosticVirtualTextInfo',  {'fg': s:P.white})
  call s:hi('DiagnosticVirtualTextHint',  {'fg': s:P.aqua})
  call s:hi('DiagnosticUnderlineError',   {'style': 'undercurl', 'sp': s:P.red})
  call s:hi('DiagnosticUnderlineWarn',    {'style': 'undercurl', 'sp': s:P.yellow})
  call s:hi('DiagnosticUnderlineInfo',    {'style': 'undercurl', 'sp': s:P.white})
  call s:hi('DiagnosticUnderlineHint',    {'style': 'undercurl', 'sp': s:P.aqua})

  " nvim-tree
  call s:hi('NvimTreeFolderName',   {'fg': s:P.white})
  call s:hi('NvimTreeRootFolder',   {'fg': s:P.pink})
  call s:hi('NvimTreeSpecialFile',  {'fg': s:P.white, 'style': 'NONE'})

  " Telescope
  call s:hi('TelescopeBorder',         {'fg': s:P.base7})
  call s:hi('TelescopeNormal',         {'fg': s:P.base8, 'bg': s:P.base0})
  call s:hi('TelescopeSelection',      {'fg': s:P.white, 'style': 'bold'})
  call s:hi('TelescopeSelectionCaret', {'fg': s:P.green})
  call s:hi('TelescopeMultiSelection', {'fg': s:P.pink})
  call s:hi('TelescopeMatching',       {'fg': s:P.aqua})

  " nvim-cmp
  call s:hi('CmpDocumentation',       {'fg': s:P.white, 'bg': s:P.base1})
  call s:hi('CmpDocumentationBorder', {'fg': s:P.white, 'bg': s:P.base1})
  call s:hi('CmpItemAbbr',            {'fg': s:P.white})
  call s:hi('CmpItemAbbrMatch',       {'fg': s:P.aqua})
  call s:hi('CmpItemAbbrMatchFuzzy',  {'fg': s:P.aqua})
  call s:hi('CmpItemKindDefault',     {'fg': s:P.white})
  call s:hi('CmpItemMenu',            {'fg': s:P.base6})
  for s:g in ['Keyword', 'Variable', 'Constant', 'Reference', 'Value']
    call s:hi('CmpItemKind' . s:g, {'fg': s:P.pink})
  endfor
  for s:g in ['Function', 'Method', 'Constructor']
    call s:hi('CmpItemKind' . s:g, {'fg': s:P.aqua})
  endfor
  for s:g in ['Class', 'Interface', 'Struct', 'Event', 'Enum', 'Unit']
    call s:hi('CmpItemKind' . s:g, {'fg': s:P.orange})
  endfor
  call s:hi('CmpItemKindModule', {'fg': s:P.yellow})
  for s:g in ['Property', 'Field', 'TypeParameter', 'EnumMember', 'Operator']
    call s:hi('CmpItemKind' . s:g, {'fg': s:P.green})
  endfor

  " lsp_signature.nvim
  call s:hi('LspSignatureActiveParameter', {'fg': s:P.orange})
endif

" ---------------------------------------------------------------------------
" Custom groups that weren't part of the theme
" ---------------------------------------------------------------------------
for [s:group, s:spec] in items(s:custom)
  if !has_key(s:seen, s:group) && (has('nvim') || s:group !~# '@')
    call s:hi(s:group, {})
  endif
endfor

unlet! s:g s:group s:spec s:seen
