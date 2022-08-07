private
privateLoadStream: aStream
	| originalTable translatedTable originalStrings |
	
	self loadHeader: aStream.
	originalTable := self loadStringPointers: aStream offset: originalTableOffset.
	translatedTable := self loadStringPointers: aStream offset: translatedTableOffset.
	originalStrings := self loadStrings: aStream pointers: originalTable.
	translatedStrings := self loadStrings: aStream pointers: translatedTable.
	translations := Dictionary new: nStrings.  
	1 to: nStrings do: [ :index |
		translations at: (originalStrings at: index) put: index ]