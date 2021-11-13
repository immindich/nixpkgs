{ stdenv, fetchFromGitHub, autoreconfHook, pkg-config, memtailor, mathic }:
stdenv.mkDerivation rec {
  name = "mathicgb";

  src = fetchFromGitHub {
    owner = "Macaulay2";
    repo = "mathicgb";
    rev = "9ed59d9afe69253ea1d1ddeeaf5eb300d45ed9e1";
    sha256 = "1imfjsfgwmz7fcx10jpyyq53xh4m49xwdxgkiynh3npnlnr720ys";
  };

  nativeBuildInputs = [ autoreconfHook pkg-config ];

  buildInputs = [ memtailor mathic ];
}
