let
  composeExtensions = f: g: final: prev:
    let
      fApplied = f final prev;
      prev' = prev // fApplied;
    in fApplied // g final prev';
in
    builtins.foldl' composeExtensions (_: _: { }) (import ./overlays)