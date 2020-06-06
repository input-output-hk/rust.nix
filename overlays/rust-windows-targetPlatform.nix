final: prev: prev.lib.optionalAttrs prev.targetPlatform.isWindows {
    targetPlatform = prev.targetPlatform // { rustc.config = "x86_64-pc-windows-gnu"; };
    stdenv = prev.stdenv // {
        targetPlatform = prev.stdenv.targetPlatform // { rustc.config = "x86_64-pc-windows-gnu"; };
    };
}