{ stdenv, fetchFromGitHub }:
stdenv.mkDerivation rec {
  pname = "cohomCalg";
  version = "0.32";

  src = fetchFromGitHub {
    owner = "BenjaminJurke";
    repo = "cohomCalg";
    rev = "v${version}";
    sha256 = "0ffz71w2808jddy075wpfd74si5h220q35kqd2ij0khjpxyqlhpn";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp bin/cohomcalg $out/bin
  '';
}
