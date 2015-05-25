private
colorForDate: aDate rowIndex: aNumber
	^ (self hasSelection and: [ self selectionContainsDate: aDate rowIndex: aNumber ])
		ifTrue: [ 'lightgrey' ]
		ifFalse: [ 'white' ]