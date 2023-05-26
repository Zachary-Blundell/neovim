" There are a couple configuration values available (shown with their default values):

" enable experimental features >
  " Currently: Enable Vim9 Script implementation
  " let g:airline_experimental = 1

" the separator used on the left side >
  " let g:airline_left_sep='>'
  let g:airline_left_sep = ''

" the separator used on the right side >
  " let g:airline_right_sep='>'
"
 " enable modified detection >
"   let g:airline_detect_modified=1
"
 " enable paste detection >
"   let g:airline_detect_paste=1
" <
" " enable crypt detection >
"   let g:airline_detect_crypt=1
"
 " enable spell detection >
"   let g:airline_detect_spell=1
"
" " display spelling language when spell detection is enabled
"   (if enough space is available) >
"   let g:airline_detect_spelllang=1
" <
"   Set to 'flag' to get a unicode icon of the relevant country flag instead of
"   the 'spelllang' itself
"
" " enable iminsert detection >
"   let g:airline_detect_iminsert=0
" <
" " determine whether inactive windows should have the left section collapsed
"   to only the filename of that buffer.  >
"   let g:airline_inactive_collapse=1
" <
" " Use alternative separators for the statusline of inactive windows >
"   let g:airline_inactive_alt_sep=1
" <
" " themes are automatically selected based on the matching colorscheme. this
"   can be overridden by defining a value. >
  let g:airline_theme='zeo'
" <
"   Note: Only the dark theme is distributed with vim-airline. For more themes,
"   checkout the vim-airline-themes repository
"   (https://github.com/vim-airline/vim-airline-themes)
"
" " if you want to patch the airline theme before it gets applied, you can
"   supply the name of a function where you can modify the palette. >
"   let g:airline_theme_patch_func = 'AirlineThemePatch'
"   function! AirlineThemePatch(palette)
"     if g:airline_theme == 'badwolf'
"       for colors in values(a:palette.inactive)
"         let colors[3] = 245
"       endfor
"     endif
"   endfunction
" <
" " if you want to update your highlights without affecting the airline theme,
"   you can do so using the AirlineAfterTheme autocmd. >
"   function! s:update_highlights()
"     hi CursorLine ctermbg=none guibg=NONE
"     hi VertSplit ctermbg=none guibg=NONE
"   endfunction
"   autocmd User AirlineAfterTheme call s:update_highlights()
" <
" " By default, airline will use unicode symbols if your encoding matches
"   utf-8. If you want the powerline symbols set this variable: >
  let g:airline_powerline_fonts = 1
" <
"   If you want to use plain ascii symbols, set this variable: >
"   let g:airline_symbols_ascii = 1
" <
" " define the set of text to display for each mode.  >
"   let g:airline_mode_map = {} " see source for the defaults
"
"   " or copy paste the following into your vimrc for shortform text
"   let g:airline_mode_map = {
"       \ '__'     : '-',
"       \ 'c'      : 'C',
"       \ 'i'      : 'I',
"       \ 'ic'     : 'I',
"       \ 'ix'     : 'I',
"       \ 'n'      : 'N',
"       \ 'multi'  : 'M',
"       \ 'ni'     : 'N',
"       \ 'no'     : 'N',
"       \ 'R'      : 'R',
"       \ 'Rv'     : 'R',
"       \ 's'      : 'S',
"       \ 'S'      : 'S',
"       \ ''     : 'S',
"       \ 't'      : 'T',
"       \ 'v'      : 'V',
"       \ 'V'      : 'V',
"       \ ''     : 'V',
"       \ }
"    Note: 'multi' is for displaying the multiple cursor mode
" <
" " define the set of filename match queries which excludes a window from
"   having its statusline modified >
"   let g:airline_exclude_filenames = [] " see source for current list
" <
" " define the set of filetypes which are excluded from having its window
"   statusline modified >
"   let g:airline_exclude_filetypes = [] " see source for current list
" <
" " define the set of names to be displayed instead of a specific filetypes
"   (for section a and b): >
"
"   let g:airline_filetype_overrides = {
"       \ 'coc-explorer':  [ 'CoC Explorer', '' ],
"       \ 'defx':  ['defx', '%{b:defx.paths[0]}'],
"       \ 'fugitive': ['fugitive', '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'],
"       \ 'floggraph':  [ 'Flog', '%{get(b:, "flog_status_summary", "")}' ],
"       \ 'gundo': [ 'Gundo', '' ],
"       \ 'help':  [ 'Help', '%f' ],
"       \ 'minibufexpl': [ 'MiniBufExplorer', '' ],
"       \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NERD'), '' ],
"       \ 'startify': [ 'startify', '' ],
"       \ 'vim-plug': [ 'Plugins', '' ],
"       \ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
"       \ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
"       \ 'vaffle' : [ 'Vaffle', '%{b:vaffle.dir}' ],
"       \ }
" <
" " defines whether the preview window should be excluded from having its window
"   statusline modified (may help with plugins which use the preview window
"   heavily) >
"   let g:airline_exclude_preview = 0
" <
" " disable the Airline statusline customization for selected windows (this is a
"   window-local variable so you can disable it per-window) >
"   let w:airline_disable_statusline = 1
" <
"   Old deprecated name: `w:airline_disabled`
"
"   See also the following options, for disabling setting the statusline
"   globally or per-buffer
" " Disable setting the statusline option: >
"   " disable globally
"   let g:airline_disable_statusline = 1
"
"   " disable per-buffer
"   let b:airline_disable_statusline = 1
"
" < This setting disables setting the 'statusline' option. This allows to use
"  e.g. the tabline extension (|airline-tabline|) but keep the 'statusline'
"  option totally configurable by a custom configuration.
" " Do not draw separators for empty sections (only for the active window) >
"   let g:airline_skip_empty_sections = 1
" <
"   This variable can be overridden by setting a window-local variable with
"   the same name (in the correct window): >
"   let w:airline_skip_empty_sections = 0
" <
" " Caches the changes to the highlighting groups, should therefore be faster.
"   Set this to one, if you experience a sluggish Vim: >
"   let g:airline_highlighting_cache = 0
" <
" " disable airline on FocusLost autocommand (e.g. when Vim loses focus): >
"   let g:airline_focuslost_inactive = 0
" <
" " configure the fileformat output
"   By default, it will display something like 'utf-8[unix]', however, you can
"   skip displaying it, if the output matches a configured string. To do so,
"   set: >
"   let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" <
" " Display the statusline in the tabline (first top line): >
"   let g:airline_statusline_ontop = 1
" <
"   Setting this option, allows to use the statusline option to be used by
"   a custom function or another plugin, since airline won't change it.
"
"   Note: This setting is experimental and works on a best effort approach.
"   Updating the statusline might not always happen as fast as needed, but that
"   is a limitation, that comes from Vim. airline tries to force an update if
"   needed, but it might not always work as expected.
"   To force updating the tabline on mode changes, call `airline#check_mode()`
"   in your custom statusline setting: `:set stl=%!airline#check_mode(winnr())`
"   will correctly update the tabline on mode changes.
"
" " Display a short path in statusline: >
"   let g:airline_stl_path_style = 'short'
" >
" " Display a only file name in statusline: >
"   let g:airline_section_c_only_filename = 1
"
