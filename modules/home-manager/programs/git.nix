{ pkgs }:

{
  enable = true;
  settings = {
    user = {
      name = "Samuel Joli";
      email = "samuel.joli.ftn@gmail.com";
    };
    core = {
      editor = "nvim";
      whitespace = "trailing-space,space-before-tab";
    };
    gpg.format = "ssh";
    commit.gpgsign = true;
    init.defaultBranch = "main";
    protocol.keybase.allow = "always";
    pull.rebase = false;
    push.autoSetupBranch = true;
    # user.signingKey = "~/.ssh/id_ed25519.pub";
  };
  ignores = [
    ".cache/"
    ".DS_Store"
    ".direnv/"
    ".idea/"
    "*.swp"
    "npm-debug.log"
    "result"
    "target"
  ];
  lfs = {
    enable = true;
  };
  package = pkgs.gitFull;
}
