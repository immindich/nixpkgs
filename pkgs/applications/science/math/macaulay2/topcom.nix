{ stdenv, fetchurl, pkg-config, gmp, cddlib, m4 }:
stdenv.mkDerivation rec {
  pname = "TOPCOM";
  version = "0.17.8";

  src = fetchurl {
    url = "https://www.wm.uni-bayreuth.de/de/team/rambau_joerg/TOPCOM-Downloads/TOPCOM-0_17_8.tgz";
    sha256 = "1axav1xrhsrj533bd2l42i7qh99c2xxvzjms471rx1gfa67vk0rz";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ gmp cddlib m4 ];
}
