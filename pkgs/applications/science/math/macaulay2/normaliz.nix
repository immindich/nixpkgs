{ stdenv, fetchurl, gmp }:
stdenv.mkDerivation rec {
  pname = "normaliz";
  version = "3.9.1";

  src = fetchurl {
    url = "https://github.com/Normaliz/Normaliz/releases/download/v3.9.1/normaliz-3.9.1.tar.gz";
    sha256 = "085abnwbx4cqn8x82g53rhnf3nk85fz4wxqqgg6ip6d37k6bwpdd";
  };

  buildInputs = [
    gmp
  ];
}
