{ stdenv, fetchFromGitHub, autoreconfHook, gtest }:
stdenv.mkDerivation rec {
  name = "memtailor";

  src = fetchFromGitHub {
    owner = "Macaulay2";
    repo = "memtailor";
    rev = "123afe02b7a458faa4be8ec3a85d6a362a5e7c89";
    sha256 = "08g9qd2mw35p3nraw39qmkp815ij6ipd4ip9ljka12dn46hhbm7g";
  };

  nativeBuildInputs = [ autoreconfHook ];
  buildInputs = [ gtest ];

  configureFlags = [ "--with-gtest=no" ];
}
