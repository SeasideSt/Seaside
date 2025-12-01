Extension { #name : 'GRPlatform' }

{ #category : '*Seaside-Gettext-Core' }
GRPlatform >> nextUInt32: aStream [
  "Answer the next unsigned, 32-bit integer from this (binary) stream."

  self subclassResponsibility
]

{ #category : '*Seaside-Gettext-Core' }
GRPlatform >> positionOfStream: strm [
	"Positioning streams in GemStone is different"
	^ strm position
]

{ #category : '*Seaside-Gettext-Core' }
GRPlatform >> stream: strm position: anInteger [
	"Positioning streams in GemStone is different"
	^ strm position: anInteger
]
