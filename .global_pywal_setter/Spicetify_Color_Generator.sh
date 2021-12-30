dest_dir="$HOME/.config/spicetify/Themes/Dribbblish/"
dest_file="color.ini"

[[ -d "$dest_dir" ]] || mkdir -pv "$dest_dir"

get_xres_rgb() {
	hex=$(xrdb -query | grep "$1" | awk '{print $2}' | cut -d# -f2)
	printf "%s\n" "${hex:0:6}"
}

output="$(cat << THEME
[pywal]
text               = $(get_xres_rgb foreground:)
subtext            = $(get_xres_rgb foreground:)
sidebar-text       = $(get_xres_rgb foreground:)
main               = $(get_xres_rgb background:)
sidebar            = $(get_xres_rgb color1:)
player             = $(get_xres_rgb background:)
card               = $(get_xres_rgb background:)
shadow             = $(get_xres_rgb background:)
selected-row       = $(get_xres_rgb color1:)
button             = $(get_xres_rgb color1:)
button-active      = $(get_xres_rgb color1:)
button-disabled    = $(get_xres_rgb color1:)
tab-active         = $(get_xres_rgb color1:)
notification       = $(get_xres_rgb color1:)
notification-error = $(get_xres_rgb color1:)
misc               = $(get_xres_rgb color1:)

[base]
text               = FFFFFF
subtext            = F0F0F0
sidebar-text       = FFFFFF
main               = 000000
sidebar            = 1ed760
player             = 000000
card               = 000000
shadow             = 202020
selected-row       = 797979
button             = 1ed760
button-active      = 1ed760
button-disabled    = 535353
tab-active         = 166632
notification       = 1db954
notification-error = e22134
misc               = BFBFBF

[white]
text               = 363636
subtext            = 3D3D3D
sidebar-text       = FFF9F4
main               = FFF9F4
sidebar            = FFA789
player             = FFF9F4
card               = FFF9F4
shadow             = d3d3d3
selected-row       = 6D6D6D
button             = ff8367
button-active      = ff8367
button-disabled    = 535353
tab-active         = ffdace
notification       = FFA789
notification-error = e22134
misc               = BFBFBF

[dark]
text               = F0F0F0
subtext            = F0F0F0
sidebar-text       = 0a0e14
main               = 0a0e14
sidebar            = C2D935
player             = 0a0e14
card               = 0a0e14
shadow             = 202020
selected-row       = DEDEDE
button             = C2D935
button-active      = C2D935
button-disabled    = 535353
tab-active         = 727d2b
notification       = C2D935
notification-error = e22134
misc               = BFBFBF

[dracula]
text               = f8f8f2
subtext            = f8f8f2
sidebar-text       = F0F0F0
main               = 44475a
sidebar            = 6272a4
player             = 44475a
card               = 6272a4
shadow             = 000000
selected-row       = bd93f9
button             = ffb86c
button-active      = 8be9fd
button-disabled    = 535353
tab-active         = 6272a4
notification       = bd93f9
notification-error = e22134
misc               = BFBFBF

[nord-light]
text               = 2e3440
subtext            = 3b4252
sidebar-text       = ECEFF4
main               = ECEFF4
sidebar            = 5E81AC
player             = ECEFF4
card               = ebcb8b
shadow             = eceff4
selected-row       = 4c566a
button             = 81a1c1
button-active      = 81a1c1
button-disabled    = c0c0c0
tab-active         = ebcb8b
notification       = a3be8c
notification-error = bf616a
misc               = BFBFBF

[nord-dark]
text               = ECEFF4
subtext            = E5E9F0
sidebar-text       = 434c5e
main               = 2e3440
sidebar            = 88C0D0
player             = 2e3440
card               = 2e3440
shadow             = 2E3440
selected-row       = D8DEE9
button             = 81A1C1
button-active      = 81A1C1
button-disabled    = 434C5E
tab-active         = 434C5E
notification       = A3BE8C
notification-error = BF616A
misc               = BFBFBF

[purple]
text               = f1eaff
subtext            = f1eaff
sidebar-text       = e0d0ff
main               = 0A0E14
sidebar            = 6F3C89
player             = 0A0E14
card               = 0A0E14
shadow             = 3a2645
selected-row       = EBDFFF
button             = c76af6
button-active      = 6F3C89
button-disabled    = 535353
tab-active         = 58306D
notification       = ff9e00
notification-error = f61379
misc               = DEDEDE

[samourai]
text               = ebdbb2
subtext            = ebdbb2
sidebar-text       = 461217
main               = 461217
sidebar            = ebdbb2
player             = 461217
card               = 461217
shadow             = 3a2645
selected-row       = 909090
button             = e7a52d
button-active      = e7a52d
button-disabled    = 535353
tab-active         = e7a52d
notification       = e7a52d
notification-error = e22134
misc               = BFBFBF

[beach-sunset]
text               = FFFFFF
subtext            = F0F0F0
sidebar-text       = F0F0F0
main               = 262626
sidebar            = bd3e3e
player             = 262626
card               = 262626
shadow             = 000000
selected-row       = d1d6e2
button             = f1a84f
button-active      = c98430
button-disabled    = 535353
tab-active         = f1a84f
notification       = c98430
notification-error = e22134
misc               = BFBFBF

[gruvbox]
text               = fbf1c7
subtext            = d5c4a1
sidebar-text       = 32302f
main               = 292828
sidebar            = 689d6a
player             = 292828
card               = 3c3836
shadow             = 202020
selected-row       = d5c4a1
button             = fb4934
button-active      = cc241d
button-disabled    = bdae93
tab-active         = fb4934
notification       = 8ec07c
notification-error = d79921
misc               = BFBFBF
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"