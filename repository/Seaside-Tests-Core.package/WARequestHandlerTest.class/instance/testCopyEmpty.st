tests
testCopyEmpty
	| copied |
	copied := handler copy.
	self deny: handler == copied.
	self assert: handler filter == handler.
	self assert: copied filter == copied