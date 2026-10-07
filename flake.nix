{
  description = "Generic devshell flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur-packages = {
      url = "github:dtomvan/nur-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;

      imports = [
        inputs.treefmt-nix.flakeModule
      ];

      perSystem =
        {
          pkgs,
          self',
          inputs',
          ...
        }:
        let
          inherit (pkgs)
            fd
            writeShellApplication
            coreutils
            gawk
            bash
            ;
          inherit (inputs'.nur-packages.legacyPackages) fitch-vizier;
        in
        {
          treefmt = {
            programs.nixfmt.enable = true;
          };

          packages.default = writeShellApplication {
            name = "check-all";
            runtimeInputs = [
              fd
              fitch-vizier
              coreutils
              gawk
              bash
            ];
            derivationArgs = {
              preferLocalBuild = true;
              allowSubstitutes = false;
            };
            text = builtins.readFile ./check.sh;
          };

          devShells.default = pkgs.mkShell {
            packages = [
              fitch-vizier
              self'.packages.check-all
            ];
          };
        };
    };
}
