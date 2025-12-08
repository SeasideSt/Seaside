Extension { #name : 'GRGemStonePlatform' }

{ #category : '*Seaside-GemStone-Gettext-Core' }
GRGemStonePlatform >> nextUInt32: aStream [
  "Answer the next unsigned, 32-bit integer from this (binary) stream."

  | n |
  n := aStream next.
  n := (n bitShift: 8) + aStream next.
  n := (n bitShift: 8) + aStream next.
  n := (n bitShift: 8) + aStream next.
  ^ n
]

{ #category : '*seaside-gemstone-gettext-examples' }
GRGemStonePlatform >> seasideGettextExampleFilesDirectory [
  ^ ((ServerFileDirectory on: (System clientEnvironmentVariable: 'GS_HOME'))
    / 'shared' / 'repos' / 'Seaside' / 'seaside-gettext-example' / 'locale')
    pathString
]
