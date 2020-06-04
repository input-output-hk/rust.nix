final: prev: rec {
    rust_1_41_0 =
        final.callPackage ./rust/1_41_0.nix {
            inherit (final.darwin.apple_sdk.frameworks) CoreFoundation Security;
            inherit (final) path;
        };
    rust = rust_1_41_0;
    rustPackages = final.rust.packages.stable;
    inherit (final.rustPackages) rustPlatform;
}