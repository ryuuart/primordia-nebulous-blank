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
            llvm = pkgs.llvmPackages_15;
            lib = pkgs.lib;
        in rec {
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

                CXXFLAGS = "-std=c++20";
                FRAMEWORK_PATH_CXX = lib.makeSearchPathOutput "dev" "include" [ llvm.libcxx ];
                FRAMEWORK_PATH_C = lib.makeSearchPath "resource-root/include" [ llvm.clang ];
                CLANG_PATH = lib.makeSearchPath "bin/clang" [ llvm.libcxxClang ];
                
                CPATH = builtins.concatStringsSep ":" [
                    (lib.makeSearchPathOutput "dev" "include" [ llvm.libcxx ])
                    (lib.makeSearchPath "resource-root/include" [ llvm.clang ])
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