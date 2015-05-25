private
splitString: aString intoChunksNoLongerThan: anInteger into: aStream
	| space lastSpaceIndex toScan |
	space := Character space.
	toScan := aString size min: anInteger + 1.
	lastSpaceIndex := 0.
	1 to: toScan do: [ :index |
		(aString at: index) = space ifTrue: [
			lastSpaceIndex := index ] ].
	
	lastSpaceIndex = 0
		ifTrue: [
			lastSpaceIndex := aString size min: anInteger.
			aStream nextPut: (aString copyFrom: 1 to: lastSpaceIndex) ]
		ifFalse: [
			aStream nextPut: (aString copyFrom: 1 to: lastSpaceIndex - 1) ].
		
	lastSpaceIndex < aString size ifTrue: [
		self
			splitString: (aString copyFrom: lastSpaceIndex + 1 to: aString size)
			intoChunksNoLongerThan: anInteger
			into: aStream ]