tests-function
testArgument
	| function |
	function := self function arguments: #(a b c).
	self assert: (function argument = #(a b c)).
	self assert: (function arguments = #(a b c))