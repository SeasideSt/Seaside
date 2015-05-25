instance creation
string: aString lineLength: anInteger
	| string |
	string := String streamContents: [ :stream |
		| lines |
		lines := self splitIntoLines: (self convertCrLfToCrIn: aString).
		lines do: [ :each |
			each size <= anInteger
				ifTrue: [ stream nextPutAll: each ]
				ifFalse: [
					(self splitString: each intoChunksNoLongerThan: anInteger)
						do: [ :chunk | stream nextPutAll: chunk ]
						separatedBy: [ stream nextPut: Character cr ] ] ]
			separatedBy: [ stream nextPut: Character cr ] ].
	^ self new
		contentString: string;
		yourself