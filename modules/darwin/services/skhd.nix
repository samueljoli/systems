{
  enable = true;
  skhdConfig = ''
    # Tile navigation

    alt - j : yabai -m window --focus south # ----------------- navigate down
    alt - k : yabai -m window --focus north
    alt - h : yabai -m window --focus west
    alt - l : yabai -m window --focus east


    # Modify layout

    shift + alt - r : yabai -m space --rotate 270 # ------------- rotate layout clockwise
    shift + alt - y : yabai -m space --mirror y-axis
    shift + alt - x : yabai -m space --mirror x-axis
    shift + alt - t : yabai -m window --toggle float --grid 4:4:1:1:2:2
    shift + alt - m : yabai -m window --toggle zoom-fullscreen
    shift + alt - e : yabai -m space --balance
  '';
}
