tests-compose
testComma
	| script element |
	script := self script.
	element := self stream nextPutAll: 'foo'.
	self assert: (script , element) == script.
	self assert: script equals: 'foo'.
	element := self stream nextPutAll: 'bar'.
	self assert: (script , element) == script.
	self assert: script equals: 'foo;bar'