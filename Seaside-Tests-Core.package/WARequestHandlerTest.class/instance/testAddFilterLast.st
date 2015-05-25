tests
testAddFilterLast
	| filter1 filter2 filter3 |
	filter1 := WARequestFilter new.
	filter2 := WARequestFilter new.
	filter3 := WARequestFilter new.
	self assert: (handler addFilterLast: filter1) = filter1.
	self assert: (handler addFilterLast: filter2) = filter2.
	self assert: (handler addFilterLast: filter3) = filter3.
	self assert: handler filters size = 3.
	self assert: handler filters first = filter1.
	self assert: handler filters last = filter3