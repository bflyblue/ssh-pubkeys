{ lib, ... }:
let
  readLines = path: lib.strings.splitString "\n" (builtins.readFile path);
  nonEmpty = builtins.filter (l: builtins.match "[[:space:]]*" l == null);
  lines = path: nonEmpty (readLines path);
in
{
  shaun = lines ./shaun.pubkeys;
}
