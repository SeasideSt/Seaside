tests-compose
testAdd
	| script element |
	script := self script.
	element := self stream nextPutAll: 'foo'.
	self assert: (script add: element) == element.
	self assert: script equals: 'foo'.
	element := self stream nextPutAll: 'bar'.
	self assert: (script add: element) == element.
	self assert: script equals: 'foo;bar'