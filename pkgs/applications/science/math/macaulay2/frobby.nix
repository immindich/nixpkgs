{ stdenv, fetchFromGitHub, cmake, gmp }:
stdenv.mkDerivation rec {
  pname = "frobby";
  version = "0.9.5";

  src = fetchFromGitHub {
    owner = "Macaulay2";
    repo = "frobby";
    rev = "cbda56e8bb0d706f8cd7e6594a8a034797f53eb5";
    sha256 = "13l3w468q16sacb8v24w83sm86k9phny2g0bhsvx8wijlh56bbf1";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ gmp ];
}
