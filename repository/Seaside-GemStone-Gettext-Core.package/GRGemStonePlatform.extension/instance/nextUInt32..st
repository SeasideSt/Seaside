*seaside-GemStone-Gettext-Core
nextUInt32: aStream
  | n |
  n := aStream next.
  n := (n bitShift: 8) + aStream next.
  n := (n bitShift: 8) + aStream next.
  n := (n bitShift: 8) + aStream next.
  ^ n