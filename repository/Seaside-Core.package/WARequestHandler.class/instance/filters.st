filters
filters
	"Answer an ordered collection of all filters active in the receiver."
	
	| current result |
	current := self filter.
	result := OrderedCollection new.
	[ current = self ] whileFalse: [
		result add: current.
		current := current next ].
	^ result