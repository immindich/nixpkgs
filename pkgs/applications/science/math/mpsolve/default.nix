{ stdenv, fetchurl, gmp }:
stdenv.mkDerivation rec {
  pname = "mpsolve";
  version = "3.2.1";

  src = fetchurl {
    url = "https://numpi.dm.unipi.it/_media/software/mpsolve/mpsolve-3.2.1.tar.bz2";
    sha256 = "011qfvflrqhzwgbd5sr413hcg4nqh22wbvjp4kd9wjsl0imjzcj5";
  };

  buildInputs = [
    gmp
  ];
}
