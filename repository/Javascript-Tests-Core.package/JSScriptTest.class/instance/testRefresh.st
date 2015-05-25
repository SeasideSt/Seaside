tests-utilities
testRefresh
	self assert: self script refresh equals: 'window.location="http://www.seaside.st/?_s=1&_k=a"'