final: prev: {
    rust = final.rust_1_41_0;
    rustPackages = final.rust.packages.stable;
    cargo = prev.cargo.override { rustc = final.rustc; };
    inherit (final.rustPackages) rustPlatform;
}