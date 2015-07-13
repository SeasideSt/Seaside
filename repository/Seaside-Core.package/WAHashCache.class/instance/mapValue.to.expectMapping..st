private
mapValue: anObject to: aKey expectMapping: aBoolean
	| valueHash index entry previous newEntry |
	valueHash := anObject hash.
	index := (valueHash \\ valueTable size) + 1.
	newEntry := WACacheValueEntry value: anObject key: aKey.
	entry := valueTable at: index.
	previous := nil.
	[ entry isNil ] whileFalse: [
		(entry valueHash = valueHash and: [ entry value = anObject ])
			ifTrue: [
				aBoolean ifFalse: [ self errorAlreadyMapped ].
				previous isNil
					ifTrue: [ valueTable at: index put: newEntry ]
					ifFalse: [  previous next: newEntry ].
				^ self ]
			ifFalse: [
				previous := entry.
				entry := entry next ] ].
	
	aBoolean ifTrue: [ self errorNotMapped ].
	previous isNil
			ifTrue: [ valueTable at: index put: newEntry ]
			ifFalse: [  previous next: newEntry ]