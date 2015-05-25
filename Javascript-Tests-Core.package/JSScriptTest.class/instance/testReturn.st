tests-function
testReturn
	| function |
	function := self function.
	function add: (self stream nextPutAll: 'foo').
	function add: (self stream nextPutAll: 'bar').
	function add: (self stream nextPutAll: 'baz').
	self assert: function equals: 'function(){foo;bar;baz}'.

	function := self function return: true.
	function add: (self stream nextPutAll: 'foo').
	function add: (self stream nextPutAll: 'bar').
	function add: (self stream nextPutAll: 'baz').
	self assert: function equals: 'function(){foo;bar;return baz}'