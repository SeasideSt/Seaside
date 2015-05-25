private
accumulate: anObject
	(instances at: anObject class ifAbsentPut: [ WAMemoryItem on: anObject class ])
		accumulate: anObject