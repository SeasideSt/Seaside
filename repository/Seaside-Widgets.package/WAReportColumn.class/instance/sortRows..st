public
sortRows: anArray
	| assocs |
	assocs := anArray collect: [ :ea | ea -> (self valueForRow: ea) ].
	assocs := assocs asSortedCollection: [ :a :b | sortBlock value: a value value: b value ].
	^ assocs collect: [ :ea | ea key ]