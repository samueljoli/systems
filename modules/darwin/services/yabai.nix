{
  enable = true;
  config = {
    layout = "bsp";
    window_placement = "second_child";

    # set modifier + right-click drag to resize window (default: resize)
    mouse_modifier = "alt";
    # set modifier + left-click drag to resize window (default: move)
    mouse_action1 = "move";
    mouse_action2 = "resize";
    mouse_drop_action = "swap";

    # padding
    top_padding = 15;
    right_padding = 15;
    bottom_padding = 15;
    left_padding = 15;
    window_gap = 15;
  };

  extraConfig = ''
    # Prevent specific applications from being tiled
    yabai -m rule --add app="Messages" manage=off
    yabai -m rule --add app="System Settings" manage=off
    yabai -m rule --add app="Downloads" manage=off
    yabai -m rule --add app="Finder" manage=off
  '';
}
