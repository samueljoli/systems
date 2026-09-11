{ username, ... }:
{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  users.users.${username}.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPgj+sZR8HJnTyCmuj170a7huQtHMme8B0RK4yvtu7xT samuel.joli.ftn@gmail.com"
  ];
}
