Extension { #name : #Collection }

{ #category : #'*Seaside-Pharo-Development' }
Collection >> inspectorFields [
	| i |
	i := 0.
	^ self asArray collect: [ :each | i := i + 1. i -> each ]
]
