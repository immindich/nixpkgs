{ clangStdenv
, lib
, callPackage
, fetchFromGitHub
, cmake
, ninja
, pkg-config
, openblas
, gmp
, libxml2
, readline
, gdbm
, boost
, tbb
, libatomic_ops
, yasm
, bison
, boehmgc
, cddlib
, mpfr
, mpfi
, mpir
, flint
, eigen
, givaro
, fflas-ffpack
, glpk
, ntl
, gtest
, singular
, mpsolve
, _4ti2
, gfan
, lrs
, csdp
, nauty
, texlive
, llvmPackages
}:

let givaro412 = givaro.overrideAttrs (oldAttrs: rec {
      src = fetchFromGitHub {
        owner = "linbox-team";
        repo = "givaro";
        rev = "7c3870d211d879b924017acf9543f1ee073e3157";
        sha256 = "0myik85ckn9c171zyp50dkpyqnh97fwrlryn9is4ln74dk3k5par";
        fetchSubmodules = true;
      };
      version = "4.1.2rc0";
    });
    fflas-ffpack250 = (fflas-ffpack.overrideAttrs (oldAttrs: rec {
      src = fetchFromGitHub {
        owner = "linbox-team";
        repo = "fflas-ffpack";
        rev = "cbb5b6839fce4249156bb93a3f41fe6554c6164c";
        sha256 = "1pfdfad7pq1x9xms3s7zjlw3z634d6zhm356yxdgmqlrmc6wwapp";
        fetchSubmodules = true;
      };
      version = "2.5.0rc0";
    })).override {
      givaro = givaro412;
    };
    memtailor = callPackage ./memtailor.nix { };
    frobby = callPackage ./frobby.nix { };
    mathic = callPackage ./mathic.nix { inherit memtailor; };
    mathicgb = callPackage ./mathicgb.nix { inherit memtailor mathic; };
    cohomCalg = callPackage ./cohomcalg.nix { };
    normaliz = callPackage ./normaliz.nix { };
    topcom = callPackage ./topcom.nix { };
    openblas-st = openblas.override { singleThreaded = true; };
in
clangStdenv.mkDerivation rec {
  pname = "macaulay2";
  version = "1.18";

  src = fetchFromGitHub {
    owner = "Macaulay2";
    repo = "M2";
    rev = "ba7fb7da5eb7b12d6761ebe4535511da37d61c1f";
    sha256 = "0xa47qm8zi4347gs02hhrm6c4z7hq13h1cxwsgzhz21xmwrdxv3l";
    fetchSubmodules = true;
  };

  postUnpack = ''
    export sourceRoot="$sourceRoot/M2"
  '';

  nativeBuildInputs = [
    cmake
    ninja
    pkg-config
    yasm
    bison
  ];

  # missing: frobby, mathic, memtailor
  buildInputs = [
    openblas-st
    gmp
    libxml2
    readline
    gdbm
    boost
    tbb
    libatomic_ops
    boehmgc
    cddlib
    mpfr
    mpfi
    mpir
    flint
    eigen
    givaro412
    fflas-ffpack250
    glpk
    ntl
    gtest
    singular
    mpsolve
    memtailor
    frobby
    mathic
    mathicgb
    _4ti2
    gfan
    cohomCalg
    lrs
    csdp
    nauty
    normaliz
    topcom
    texlive.combined.scheme-basic
    llvmPackages.openmp
  ];

  DREADLINE_ROOT_DIR="${readline}";
  DREADLINE_INCLUDE_DIR="${readline}/include";

  cmakeFlags = [
    "-GNinja"
    "-DREADLINE_ROOT_DIR=${readline}"
    "-DREADLINE_INCLUDE_DIR=${readline}/include"
  ];


  buildPhase = ''
    ninja -v -j 4 M2-binary
  '';

  installPhase = ''
    echo "installing"
    false
  '';
}
