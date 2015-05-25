*seaside-tests-internetexplorer
testImNice
	self response imNice.
	self assert: (self response headerAt: 'P3P') = 'CP="CAO PSA OUR"'.
	self assert: (self response headers size) = 1