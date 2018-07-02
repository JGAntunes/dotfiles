function toggle-background-color -d "Toggle between solarized dark and light"
  [ "$color_scheme" -eq 1 ] ; set -gx color_scheme $status;

  if test $color_scheme -eq 1
    set -gx theme_color_scheme solarized-dark
    echo -en "\033]50;SetColors=preset=Solarized Dark - Patched\a"
  else
    set -gx theme_color_scheme solarized-light
    echo -en "\033]50;SetColors=preset=Solarized Light\a"
  end
end
