Extension { #name : #WAKeyGenerator }

{ #category : #'*Seaside-Tests-Core' }
WAKeyGenerator classSide >> use: aKeyGenerator during: aNiladicBlock [
	| old |
	old := current.
	current := aKeyGenerator.
	^ aNiladicBlock ensure: [
		current := old ]
]
