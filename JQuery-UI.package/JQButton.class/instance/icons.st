accessing
icons
	^ self options at: 'icons' ifAbsentPut: [ GRSmallDictionary new ]