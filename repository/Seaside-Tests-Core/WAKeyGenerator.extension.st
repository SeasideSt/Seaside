Extension { #name : 'WAKeyGenerator' }

{ #category : '*Seaside-Tests-Core' }
WAKeyGenerator class >> use: aKeyGenerator during: aNiladicBlock [
	| old |
	old := current.
	current := aKeyGenerator.
	^ aNiladicBlock ensure: [
		current := old ]
]
