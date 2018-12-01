Extension { #name : #Collection }

{ #category : #'*seaside-pharo-development-core' }
Collection >> inspectorFields [
	| i |
	i := 0.
	^ self asArray collect: [ :each | i := i + 1. i -> each ]
]
