*Seaside-GemStone-Gettext-Core
nextUInt32: aStream
  "Answer the next unsigned, 32-bit integer from this (binary) stream."

  | n |
  n := aStream next.
  n := (n bitShift: 8) + aStream next.
  n := (n bitShift: 8) + aStream next.
  n := (n bitShift: 8) + aStream next.
  ^ n