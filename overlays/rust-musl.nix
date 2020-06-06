final: prev: prev.lib.optionalAttrs prev.targetPlatform.isMusl {
    rustc = final.rustPackages.rustc.overrideDerivation  (drv: {
        configureFlags =
            # We need to pull musl from the targetPackages set. We want musl
            # *for* the target platform. rustc is being pulled from the
            # buildPackages (build -> target compiler), but we link against
            # musl, thus musl needs to be compiled for the target, not the
            # build system (which final.musl would be).
            (drv.configureFlags ++ [ "--set=rust.musl-root=${final.targetPackages.musl}" ]);
    });
}