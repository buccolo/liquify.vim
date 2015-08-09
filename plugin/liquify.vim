" LiquifyAssetUrl
" Converts this:
" <img src="Assets/logo.png" .... >
" Into:
" <img src="{{ 'logo.png' | asset_url }}" .... >
"
function! LiquifyAssetUrl()
  :normal ci"
  :normal a{{ '
  :normal p
  :normal f"
  :normal i' | asset_url }}
endfunction
:map <leader>la :call LiquifyAssetUrl()<CR>

" LiquifySetting
" Converts this:
" <a href="http://www.facebook.com" target="new">
" Into:
" <a href="{{ settings.facebook_url }}" target="new">
" With clipboard:
" "facebook_url": "http://www.facebook.com",
"
function! LiquifySetting()
  let @l = input('Preset name: ')
  :normal gvx
  :normal i{{ settings.
  :normal "lp
  :normal a }}
  :normal O"
  :normal "lp
  :normal A": "
  :normal p
  :normal A",
  :normal dd
endfunction
:map <leader>ls :call LiquifySetting()<CR>

" LiquifySettingString
" Converts this:
" <a href="{{ 'image.jpg' | asset_url }}" target="new">
" Into:
" <a href="{{ settings.facebook_url }}" target="new">
" With clipboard:
" "facebook_url": "http://www.facebook.com",
"
function! LiquifySettingString()
  let @l = input('Preset name: ')
  :normal gv"ax
  :normal xhx
  :normal isettings.
  :normal "lp
  :normal O"
  :normal "lp
  :normal A": "
  :normal "ap
  :normal A",
  :normal dd
endfunction
:map <leader>lS :call LiquifySettingString()<CR>

" "facebook_url": "http://www.facebook.com",
function! Preset2Schema()
  let @l = input('Label: ')
  :normal "ayiwdd
  :normal O{
  :normal o"label": "
  :normal "lpa",
  :normal o"type": "text",
  :normal o"preset_variable": "
  :normal "apa"
  :normal o},
endfunction
:map <leader>lp :call Preset2Schema()<CR>