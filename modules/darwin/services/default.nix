{ ... }:
{
  services.yabai = import ./yabai.nix;

  services.skhd = import ./skhd.nix;
}
