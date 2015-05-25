tests-utilities
testCallback
	self assert: (self script callback: [ ]) equals: 'window.location="http://www.seaside.st/?_s=1&_k=a&1"'