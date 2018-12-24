initialization
initializeWithAccepts: aCollectionOfAccepts
	self initialize.
	accepts := GROrderedMultiMap2 new.
	aCollectionOfAccepts isNil ifFalse: [
		aCollectionOfAccepts do: [ :each |
			accepts at: each quality add: each value ] ]