dest_dir="$HOME/.local/share/color-schemes/"
dest_file="pywal.colors"

[[ -d "$dest_dir" ]] || mkdir -pv "$dest_dir"

get_xres_rgb() {
	hex=$(xrdb -query | grep "$1" | awk '{print $2}' | cut -d# -f2)
	printf "%d,%d,%d\n" "0x${hex:0:2}" "0x${hex:2:2}" "0x${hex:4:2}"
}

output="$(cat << THEME
[ColorEffects:Disabled]
Color=$(get_xres_rgb color8:)

[ColorEffects:Inactive]
Color=$(get_xres_rgb color8:)

[Colors:Button]
BackgroundNormal=$(get_xres_rgb background:)
ForegroundNormal=$(get_xres_rgb foreground:)
DecorationFocus=$(get_xres_rgb color15:)
DecorationHover=$(get_xres_rgb color15:)

[Colors:Complementary]
BackgroundNormal=$(get_xres_rgb background:)
ForegroundNormal=$(get_xres_rgb foreground:)
DecorationFocus=$(get_xres_rgb color15:)
DecorationHover=$(get_xres_rgb color15:)

[Colors:Selection]
BackgroundNormal=$(get_xres_rgb color8:)
ForegroundNormal=$(get_xres_rgb foreground:)
DecorationFocus=$(get_xres_rgb color15:)
DecorationHover=$(get_xres_rgb color15:)

[Colors:Tooltip]
BackgroundNormal=$(get_xres_rgb background:)
ForegroundNormal=$(get_xres_rgb foreground:)
DecorationFocus=$(get_xres_rgb color15:)
DecorationHover=$(get_xres_rgb color15:)

[Colors:View]
BackgroundNormal=$(get_xres_rgb background:)
ForegroundNormal=$(get_xres_rgb foreground:)
DecorationFocus=$(get_xres_rgb color15:)
DecorationHover=$(get_xres_rgb color15:)

[Colors:Window]
BackgroundNormal=$(get_xres_rgb background:)
ForegroundNormal=$(get_xres_rgb foreground:)

[General]
ColorScheme=pywal
Name=pywal
shadeSortColumn=true

[KDE]
contrast=0

[WM]
BackgroundNormal=$(get_xres_rgb background:)
ForegroundNormal=$(get_xres_rgb foreground:)
DecorationFocus=$(get_xres_rgb color15:)
DecorationHover=$(get_xres_rgb color15:)
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"