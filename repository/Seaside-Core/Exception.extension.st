Extension { #name : #Exception }

{ #category : #'*Seaside-Core' }
Exception >> seasidePossibleCauses [
	"Used by WAWalkback to render a list of what might have caused the receiver to be signaled.
	answers a collection of strings"
	^ #()
]
