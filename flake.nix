{
  description = "Development environment with custom prompt";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        dev_env_name = "dev";
      in
      {
        devShells.default = pkgs.mkShell {
          SHELL = "${pkgs.bashInteractive}/bin/bash";

          # 👇 Add your development packages here
          buildInputs = with pkgs; [
            bashInteractive
            # add packages here
            cmake
          ];

          shellHook = ''
            export SHELL="${pkgs.bashInteractive}/bin/bash"

            if [[ $- == *i* ]]; then
              export PS1='\[\e[32m\][\u@\h:\w]\[\e[0m\]\n\[\e[36m\](${dev_env_name})\[\e[0m\] \[\e[32m\]>\[\e[0m\] '
              echo "🚀 Welcome to ${dev_env_name} environment!"
              echo ""
            fi
          '';
        };
      }
    );
}
