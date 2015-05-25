accessing
data
	^ self options at: 'data' ifAbsentPut: [ JSJoin new ]