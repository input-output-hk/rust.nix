# rust will pass -lpthread, however nix has libpthread split into a separate
# package.  Thus to prevent rustc from failing to build due to
#
#    cannot find -lpthread
#
# We need to inject the -L flags into NIX_LDFLAGS while building rustc.
# Notably rust will try to statically link it and nixpkgs by default
# disables static products m(.
final: prev: prev.lib.optionalAttrs prev.targetPlatform.isWindows {
    rustc = final.rustPackages.rustc.overrideDerivation (drv: {
        NIX_DEBUG = 3;
        NIX_x86_64_w64_mingw32_LDFLAGS = final.lib.optionals final.stdenv.targetPlatform.isWindows [
            "-L${final.targetPackages.windows.mingw_w64_pthreads.overrideDerivation (_ : { dontDisableStatic = true; })}/lib"
            "-L${final.targetPackages.windows.mcfgthreads}/lib"
            "-lmcfgthread"
        ];
    });
}