{ inputs, ... }:

{
  imports = [
    inputs.self.darwinModules.common
    inputs.self.darwinModules.builder
    inputs.self.darwinModules.hercules-ci
    inputs.self.darwinModules.remote-builder
  ];

  nixCommunity.remote-builder.key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEmdo1x1QkRepZf7nSe+OdEWX+wOjkBLF70vX9F+xf68 builder";

  nix.settings.sandbox = "relaxed";
  nix.settings.extra-platforms = [ "x86_64-darwin" ];

  # disable nixos-tests
  nix.settings.system-features = [ "big-parallel" ];

  networking.hostName = "darwin02";

  system.stateVersion = 4;
}
