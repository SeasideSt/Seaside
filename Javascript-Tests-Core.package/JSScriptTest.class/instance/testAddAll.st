tests-compose
testAddAll
	| script elements |
	script := self script.
	elements := Array 
		with: (self stream nextPutAll: 'foo')
		with: (self stream nextPutAll: 'bar').
	self assert: (script addAll: elements) == elements.
	self assert: script equals: 'foo;bar'