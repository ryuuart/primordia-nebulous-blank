{
  description = "This is a template to make amazing projects or other templates.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-23.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    let
      systems = [ "aarch64-darwin" "x86_64-linux" "aarch64-linux" ];
    in
    flake-utils.lib.eachSystem systems (system:
      let
        pkgs = import nixpkgs { inherit system; };
        llvm = pkgs.llvmPackages_16;
        lib = pkgs.lib;
      in
      rec {
        devShells.default = pkgs.mkShell {
          packages = [
            # XXX: the order of include matters
            llvm.libcxxClang
            llvm.libcxxStdenv
            pkgs.clang-tools

            # debugger
            llvm.lldb

            pkgs.gtest
            pkgs.cmake
          ];

          shellHook = ''
            echo
            echo "     [[[[[  Welcome to the Nebula  ]]]]]"
            echo "     ᚤᛟᚢ ᚨᚱᛖ ᛒᛖᚲᛟᛗᛁᚾᚷ ᛟᚾᛖ ᚹᛁᛏᚺ ᛏᚺᛖ ᛋᛏᚨᚱᛋ"
            echo "     [[[[[  •+-#—*#•-##++-*+-+••## ]]]]]"
            echo
          '';
        };

        packages = rec {
          default = pkgs.stdenv.mkDerivation {
            name = "nebula";
            version = "0.1.0";
            src = self;

            nativeBuildInputs = [
              # XXX: the order of include matters
              llvm.libcxxClang
              # llvm.libcxxStdenv
              # pkgs.clang-tools
              pkgs.cmake
            ];

            buildPhase = ''
              cmake --build . 
            '';

            installPhase = ''
              mkdir -p $out/bin
              cp Nebula $out/bin
            '';
          };
        };
      }
    );
}
