[
    (import ./rust-nix.nix)
    # (import ./rust-version.nix)
    # rust needs some platform rewrite.
    (import ./rust-windows-targetPlatform.nix)
    (import ./rust-musl.nix)
    (import ./rust-windows-threads.nix)
]