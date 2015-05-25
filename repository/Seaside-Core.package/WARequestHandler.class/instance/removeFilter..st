filters
removeFilter: aFilter
	"Remove aFilter from the receiver. Answer the removed filter or nil."

	| previous current |
	previous := nil.
	current := self filter.
	[ current = self ] whileFalse: [
		current = aFilter ifTrue: [
			previous isNil
				ifTrue: [ self setFilter: current next ]
				ifFalse: [ previous setNext: current next ].
			^ aFilter setNext: nil ].
		previous := current.
		current := current next ].
	^ nil