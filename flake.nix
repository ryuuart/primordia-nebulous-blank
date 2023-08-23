{
  description = "This is a template to make amazing projects or other templates.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        llvm = pkgs.llvmPackages_16;
        lib = pkgs.lib;
      in
      rec {
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.cmake

            # debugger
            llvm.lldb

            # XXX: the order of include matters
            pkgs.clang-tools
            llvm.libcxxClang
            llvm.libcxxStdenv

            pkgs.gtest
          ];

          shellHook = ''
            echo
            echo "     [[[[[  Welcome to the Nebula  ]]]]]"
            echo "     ᚤᛟᚢ ᚨᚱᛖ ᛒᛖᚲᛟᛗᛁᚾᚷ ᛟᚾᛖ ᚹᛁᛏᚺ ᛏᚺᛖ ᛋᛏᚨᚱᛋ"
            echo "     [[[[[  •+-#—*#•-##++-*+-+••## ]]]]]"
            echo
          '';
        };
      }
    );
}
