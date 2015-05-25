tests
testAddFilter
	| filter1 filter2 |
	filter1 := WARequestFilter new.
	filter2 := WARequestFilter new.
	self assert: (handler addFilter: filter1) = filter1.
	self assert: (handler addFilter: filter2) = filter2.
	self assert: handler filters size = 2.
	self assert: handler filters first = filter1.
	self assert: handler filters last = filter2