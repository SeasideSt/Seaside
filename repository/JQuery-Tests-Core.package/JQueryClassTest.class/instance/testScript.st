tests-creation
testScript
	self assert: (self jQuery script: [ :s | ]) = ''.
	self assert: (self jQuery script: [ :s | s add: s jQuery ]) = self function.
	self assert: (self jQuery script: [ :s | s add: (s jQuery: 'a') ]) = (self function , '("a")')