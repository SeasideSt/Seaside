private
removeFromValueTable: anObject
	| entry valueHash index previous |
	valueHash := anObject hash.
	index := (valueHash \\ valueTable size) + 1.
	entry := valueTable at: index.
	previous := nil.
	[	"no need for nil check it has to be there"
		(entry valueHash = valueHash and: [ entry value = anObject ])
			ifTrue: [
				 previous isNil
					ifTrue: [ valueTable at: index put: entry next ]
					ifFalse: [ previous next: entry next ].
				^ self ]
			ifFalse: [
				previous := entry.
				entry := entry next ] ] repeat