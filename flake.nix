{
  description = "cli learning dev environment";

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
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [

            # Rust
            rustc
            cargo
            rust-analyzer
            clippy
            rustfmt
            rustPlatform.rustLibSrc

            # CLI tools
            just

            # Docs
            mdbook

            # Diagram
            mermaid-cli

            # Slides
            marp-cli
          ];
        };
      }
    );
}
