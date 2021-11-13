{ stdenv, fetchFromGitHub, autoreconfHook, memtailor, pkg-config }:
stdenv.mkDerivation rec {
  name = "mathic";

  src = fetchFromGitHub {
    owner = "Macaulay2";
    repo = "mathic";
    rev = "68da8d452dcafeb07fc8749839c566662a2f9b03";
    sha256 = "0i13m2d8jbj3s63jmban8kz8np7iz84w3yifjg2wf9wkqwif2pzz";
  };

  nativeBuildInputs = [ autoreconfHook pkg-config ];

  buildInputs = [ memtailor ];
}
