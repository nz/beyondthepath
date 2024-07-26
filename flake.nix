{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    allSystems = ["aarch64-darwin"];
    overlays = [
      (final: prev: {
        gemfile = final.bundlerEnv {
          name = "gemfile";
          gemdir = ./.;
        };
      })
    ];
    forAllSystems = f:
      nixpkgs.lib.genAttrs allSystems (
        system:
          f {
            pkgs = import nixpkgs {inherit overlays system;};
          }
      );
  in {
    devShells = forAllSystems ({pkgs, ...}: {
      default = pkgs.mkShell {
        packages =
          (with pkgs; [ruby bundix gemfile yarn])
          ++ pkgs.lib.optionals pkgs.stdenv.isDarwin (with pkgs.darwin.apple_sdk.frameworks; [CoreServices]);
      };
    });
  };
}
