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
        { pkgs, inputs', ... }:
        let
          inherit (pkgs)
            fd
            ripgrep
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

          devShells.default = pkgs.mkShell {
            packages = [
              fd
              ripgrep
              fitch-vizier
              (writeShellApplication {
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
                inheritPath = false;
                text = ''
                  fd -e fitch --exec sh -c 'test -s {} && fitchv --no-template {} || echo {} IS WRONG' | uniq -c
                  fd -e fitch --exec wc -l | awk 'BEGIN {x=0;} {x+=$1} END{print x;}'
                '';
              })
            ];
          };
        };

      flake = {
      };
    };
}
