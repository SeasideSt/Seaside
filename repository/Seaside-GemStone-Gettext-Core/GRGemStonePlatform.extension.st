Extension { #name : 'GRGemStonePlatform' }

{ #category : '*seaside-GemStone-Gettext-Core' }
GRGemStonePlatform >> nextUInt32: aStream [
  | n |
  n := aStream next.
  n := (n bitShift: 8) + aStream next.
  n := (n bitShift: 8) + aStream next.
  n := (n bitShift: 8) + aStream next.
  ^ n
]

{ #category : '*seaside-GemStone-Gettext-Core' }
GRGemStonePlatform >> positionOfStream: strm [
  ^ strm positionA
]

{ #category : '*seaside-gemstone-gettext-core' }
GRGemStonePlatform >> seasideGettextExampleFilesDirectory [
  | seasideGitCheckoutLocation getTextExampleLocation |
  "Trying to determine the checkout location of the Seaside repo is up for improvement. This is only tested on a GsDevKit setup and Github CI"
  seasideGitCheckoutLocation := (System clientEnvironmentVariable: 'GS_HOME')
    ifNil: [ Error signal: 'GS_HOME not defined (when running seaside gettext example).' ]
    ifNotNil: [ :string | string , '/shared/repos/Seaside' ].
  getTextExampleLocation := seasideGitCheckoutLocation
    , '/seaside-gettext-example/locale/'.
  ^ (ServerFileDirectory on: getTextExampleLocation) exists
    ifTrue: [ getTextExampleLocation ]
    ifFalse: [ 
      "Github CI"
      '/home/runner/work/Seaside/Seaside/seaside-gettext-example/locale' ]
]

{ #category : '*seaside-GemStone-Gettext-Core' }
GRGemStonePlatform >> stream: strm position: anInteger [
  ^ strm positionA: anInteger
]
