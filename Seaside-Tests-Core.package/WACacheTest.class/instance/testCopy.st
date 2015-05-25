tests
testCopy
	| one two copy |
	one := cache store: 1.
	two := cache store: 2.
	
	copy := cache copy.
	copy removeKey: one.
	
	self assert: (cache at: one) = 1.
	self assert: (cache at: two) = 2.
	self assert: (cache keyAtValue: 1) = one.
	self assert: (cache keyAtValue: 2) = two.
	self assert: (copy at: two) = 2.
	self assert: (copy keyAtValue: 2) = two.
	self assert: (copy keyAtValue: 1) isNil.
	self assert: (copy at: one) isNil.
	
	self deny: (cache instVarNamed: 'mutex') == (copy instVarNamed: 'mutex').
	self deny: cache expiryPolicy == copy expiryPolicy.
	self deny: cache missStrategy == copy missStrategy.
	self deny: cache removalAction == copy removalAction.
	self deny: cache reapingStrategy == copy reapingStrategy