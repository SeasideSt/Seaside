decorations
removeDecoration: aDecoration 
	"Remove aDecoration from the chain of decorations. Answer nil if aDecoration is not present."

	| previous current |
	previous := nil.
	current := self decoration.
	[ current = self ] whileFalse: [
		current = aDecoration ifTrue: [
			previous isNil
				ifTrue: [ self decoration: current next ]
				ifFalse: [ previous setNext: current next ].
			^ aDecoration setNext: nil ].
		previous := current.
		current := current next ].
	^ nil