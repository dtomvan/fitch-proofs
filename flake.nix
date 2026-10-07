{
  description = "Generic devshell flake";

  nixConfig = {
    extra-substituters = [ "https://attic.bartoostveen.nl/dtomvan-nur" ];
    extra-trusted-public-keys = [ "dtomvan-nur:UyHAqPSYjeqV2WZalOzuEnsy9iqXiskJ0S31Y/gZUdw=" ];
  };

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
                  fd -e fitch --exec sh -c 'test -s {} && printf "%s: " "{}" && fitchv --no-template {}'
                '';
              })
            ];
          };
        };
    };
}
