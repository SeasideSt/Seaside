options
from
	^ self options 
		at: 'from'
		ifAbsentPut: [ GRSmallDictionary2 new ]