accessing
delegations
	"Answer an ordered collection of all delegations active in the receiver."
	
	^ self decorations select: [ :each | each isDelegation ]