# sops-nix secret management, shared across the CM4 fleet.
#
# Encrypted secrets live in ../../secrets/*.yaml (safe to commit, even public).
# At activation sops-nix decrypts them to /run/secrets/... (tmpfs) using the
# node's own age key, which is DERIVED from its SSH host key
# (/etc/ssh/ssh_host_ed25519_key). A node can therefore only read a secret once
# its age public key has been added to .sops.yaml AND the file re-encrypted
# (`sops updatekeys secrets/common.yaml`).
#
# BOOTSTRAP ORDER (chicken-and-egg): a freshly flashed node has no registered
# key yet, so it CANNOT decrypt anything on first boot. Do not enable the
# secret below until the node is registered:
#   1. Flash + boot the node (its SSH host key is generated on first boot).
#   2. Read its age key:
#        ssh-keyscan -t ed25519 <node-ip> \
#          | nix shell nixpkgs#ssh-to-age -c ssh-to-age
#   3. Add that key as &node1 in .sops.yaml, uncomment it under the
#      creation_rules, then: nix shell nixpkgs#sops -c sops updatekeys \
#        secrets/common.yaml
#   4. Uncomment the block below and rebuild/redeploy.
{ config, username, ... }:
{
  sops = {
    defaultSopsFile = ../../secrets/common.yaml;
    # Derive this node's decryption key from its SSH host key.
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
  };

  # --- Enable after this node's age key is registered (see BOOTSTRAP ORDER) ---
  # Until then, first-boot login uses the committed initialHashedPassword
  # (or SSH key). Enabling this before the node can decrypt will fail activation.
  #
  # sops.secrets."users/${username}/hashed-password".neededForUsers = true;
  # users.users.${username}.hashedPasswordFile =
  #   config.sops.secrets."users/${username}/hashed-password".path;
}
