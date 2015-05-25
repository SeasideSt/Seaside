initialization
initializeWithAccepts: aCollectionOfAccepts
	self initialize.
	accepts := GROrderedMultiMap new.
	aCollectionOfAccepts isNil ifFalse: [
		aCollectionOfAccepts do: [ :each |
			accepts at: each quality add: each value ] ]