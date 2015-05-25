accessing
table
	^ table ifNil: [ table := self buildTable ]