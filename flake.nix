{
  description = "wc dev environment";

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

            # CLI tools
            just

            # Docs
            mdbook

            #markdown
            markdown-toc
            markdownlint-cli2
            # Diagram
            mermaid-cli

            # Slides
            marp-cli
          ];
        };
      }
    );
}
