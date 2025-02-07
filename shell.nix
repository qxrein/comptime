{ compiler ? "ghc948" }:
let
  pkgs = import <nixpkgs> { };
  haskellPackages = pkgs.haskell.packages.${compiler};
in
pkgs.mkShell {
  buildInputs = [
    haskellPackages.ghc
    pkgs.cabal-install
    haskellPackages.template-haskell
  ];
}
