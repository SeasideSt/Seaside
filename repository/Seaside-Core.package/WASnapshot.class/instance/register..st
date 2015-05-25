registry
register: anObject
	"Register anObject for backtracking."

	anObject isNil
		ifFalse: [ objects at: anObject put: anObject snapshotCopy ]