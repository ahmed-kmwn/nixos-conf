{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./sys_settings.nix
    ./desktop.nix
    ./packages.nix
  ];

  system.stateVersion = "25.11";
}
