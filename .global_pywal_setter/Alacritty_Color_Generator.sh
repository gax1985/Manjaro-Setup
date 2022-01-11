# Idea from: https://github.com/dylanaraps/pywal/issues/264

dest_dir="$HOME/.config/alacritty/"
dest_file="alacritty.yml"

[[ -d "$dest_dir" ]] || mkdir -pv "$dest_dir"

get_xres_rgb() {
	hex=$(xrdb -query | grep "$1" | awk '{print $2}' | cut -d# -f2)
	printf "#%s\n" "${hex:0:6}"
}

output="$(cat << THEME
window:
  padding:
    x: 10
    y: 10

font:
  normal:
    family: MesloLGS NF
  size: 7

shell:
  program: /bin/zsh

key_bindings:
  - { key: F11, action: ToggleFullscreen }
colors:
  primary:
    background: "$(get_xres_rgb background:)"
    foreground: "$(get_xres_rgb foreground:)"
  cursor:
    text: "$(get_xres_rgb background:)"
    cursor: "$(get_xres_rgb foreground:)"
  normal:
    black: "$(get_xres_rgb background:)"
    red: "$(get_xres_rgb color1:)"
    green: "$(get_xres_rgb color2:)"
    yellow: "$(get_xres_rgb color3:)"
    blue: "$(get_xres_rgb color4:)"
    magenta: "$(get_xres_rgb color5:)"
    cyan: "$(get_xres_rgb color6:)"
    white: "$(get_xres_rgb foreground:)"
  bright:
    black: "$(get_xres_rgb foreground:)"
    red: "$(get_xres_rgb color1:)"
    green: "$(get_xres_rgb color2:)"
    yellow: "$(get_xres_rgb color3:)"
    blue: "$(get_xres_rgb color4:)"
    magenta: "$(get_xres_rgb color5:)"
    cyan: "$(get_xres_rgb color6:)"
    white: "$(get_xres_rgb background:)"

THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"