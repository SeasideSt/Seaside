tests
testRemoveFilter
	| filter1 filter2 |
	handler addFilter: (filter1 := WARequestFilter new).
	handler addFilter: (filter2 := WARequestFilter new).
	self assert: (handler removeFilter: WARequestFilter new) isNil.
	self assert: (handler removeFilter: filter1) = filter1.
	self assert: handler filters size = 1.
	self assert: handler filters first = filter2.
	self assert: (handler removeFilter: filter2) = filter2.
	self assert: handler filters isEmpty.
	self assert: (handler removeFilter: filter2) isNil