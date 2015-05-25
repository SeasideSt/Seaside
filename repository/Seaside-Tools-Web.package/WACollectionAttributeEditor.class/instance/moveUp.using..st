private
moveUp: aSelectedCollection using: aCollection
	| index |
	aSelectedCollection do: [ :each |
		index := aCollection indexOf: each ifAbsent: [ 0 ].
		index > 1 
			ifTrue: [ aCollection swap: index with: index - 1 ] ].
	^ aCollection