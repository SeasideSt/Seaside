private
moveDown: aSelectedCollection using: aCollection
	| index |
	aSelectedCollection reverse do: [ :each | 
		index := aCollection indexOf: each ifAbsent: [ aCollection size ].
		index < aCollection size
			ifTrue: [ aCollection swap: index with: index + 1 ] ].
	^ aCollection