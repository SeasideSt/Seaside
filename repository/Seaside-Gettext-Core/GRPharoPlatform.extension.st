Extension { #name : 'GRPharoPlatform' }

{ #category : '*Seaside-Gettext-Core' }
GRPharoPlatform >> nextUInt32: aStream [
	"Answer the next unsigned, 32-bit integer from this (binary) stream."
	^ aStream uint32
]
