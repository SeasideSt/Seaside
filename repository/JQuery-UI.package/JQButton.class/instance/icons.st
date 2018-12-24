accessing
icons
	^ self options at: 'icons' ifAbsentPut: [ GRSmallDictionary2 new ]