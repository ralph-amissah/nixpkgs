{ lib, stdenv, fetchurl, fuse, pkg-config }:

stdenv.mkDerivation rec {
  version = "1.15.0";
  pname = "bindfs";

  src = fetchurl {
    url    = "https://bindfs.org/downloads/${pname}-${version}.tar.gz";
    sha256 = "sha256-fTpXEf5pJV0Mh1MTxVikNvSx5fjcBq10WmGBdqzAx8k=";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ fuse ];
  postFixup = ''
    ln -s $out/bin/bindfs $out/bin/mount.fuse.bindfs
  '';

  meta = {
    description = "A FUSE filesystem for mounting a directory to another location";
    homepage    = "https://bindfs.org";
    license     = lib.licenses.gpl2;
    maintainers = with lib.maintainers; [ lovek323 ];
    platforms   = lib.platforms.unix;
  };
}
