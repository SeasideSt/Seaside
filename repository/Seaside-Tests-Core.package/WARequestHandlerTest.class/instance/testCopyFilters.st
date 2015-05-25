tests
testCopyFilters
	| copied |
	handler addFilter: WARequestFilter new.
	handler addFilter: WARequestFilter new.
	copied := handler copy.
	self deny: handler == copied.
	self deny: handler filter == copied filter.
	self deny: handler filter next == copied filter next.
	self assert: handler filter handler == handler.
	self assert: copied filter handler == copied