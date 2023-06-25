private
openBrush
	super openBrush.
	self class stringKeysOnly
		ifTrue: [ key jsonKeyOn: canvas ]
		ifFalse: [ key jsonOn: canvas ].
	self document stream nextPutAll: ': '