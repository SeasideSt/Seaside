filters
addFilterLast: aFilter
	"Add aFilter as the last one in the filter chain. Answer the filter added."

	| previous current |
	previous := nil.
	current := self filter.
	[ current = self ] whileFalse: [
		previous := current.
		current := current next ].
	aFilter setNext: current.
	previous isNil
		ifTrue: [ self setFilter: aFilter ]
		ifFalse: [ previous setNext: aFilter ].
	^ aFilter