{ pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    forwardAgent = true;
  };
}

