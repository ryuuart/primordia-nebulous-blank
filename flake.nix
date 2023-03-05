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
            pythonPkgs = pkgs.python310Packages;
        in rec {
            devShells.default = pkgs.mkShell {
                name = "python-star";

                venvDir = "./venv"; 

                packages = with pkgs; [
                    pythonPkgs.venvShellHook
                    pythonPkgs.pip
                    pythonPkgs.setuptools

                    zlib
                ];

                postVenvCreation = ''
                    echo "Generated pythonic synthesis domain."
                '';

                postShellHook = ''
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