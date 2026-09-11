{ config, ... }:
# Pi coding agent config (~/.pi/agent).
#
# Returns an attrset of home.file entries to be merged into home.file.
#
# - settings.json is linked via mkOutOfStoreSymlink so pi can keep writing to
#   it (`pi install`, `/settings` Ctrl+S, lastChangelogVersion). Those writes
#   land in this repo's working tree, ready to commit.
# - APPEND_SYSTEM.md is a plain read-only store symlink; pi never writes it.
#
# Note: the pi binary itself is provided by the pi-agent flake input (see
# packages in ../../default.nix). Extensions are declared in settings.json
# under `packages` (e.g. "npm:pi-powerline-footer"); pi reinstalls them on
# startup, so most extensions need no local files. Raw extension files (not
# published as npm packages) live in ./extensions and are linked into
# ~/.pi/agent/extensions for auto-discovery. Auth (OAuth tokens in auth.json)
# is set up per machine with `pi login` and is intentionally not tracked here.
let
  repo = "${config.home.homeDirectory}/development/systems/modules/home-manager/programs/pi";
in
{
  ".pi/agent/settings.json".source =
    config.lib.file.mkOutOfStoreSymlink "${repo}/settings.json";

  ".pi/agent/APPEND_SYSTEM.md".source = ./APPEND_SYSTEM.md;

  ".pi/agent/extensions/notify.ts".source = ./extensions/notify.ts;
}
