private
openBrush
	self document nextPutAll: 'function('.
	arguments isNil ifFalse: [
		arguments do: [ :each | self document identifier: each ]
		separatedBy: [ self document nextPut: $, ].].
	self document nextPut: $).
	self document openBlock