Extension { #name : #Collection }

{ #category : #'*seaside-gemStone-tools-production' }
Collection >> inspectorFields [
	| i |
	i := 0.
	^ self asArray collect: [ :each | i := i + 1. i -> each ]
]
