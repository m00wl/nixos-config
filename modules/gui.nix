{ config, pkgs, ... }:

{
  imports = [
    ./src/gnome.nix
    ./src/sound.nix
  ];
}
