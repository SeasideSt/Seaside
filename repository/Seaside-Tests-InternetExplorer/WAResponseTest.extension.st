Extension { #name : #WAResponseTest }

{ #category : #'*seaside-tests-internetexplorer' }
WAResponseTest >> testForceSafe [
	self response forceSafe.
	self assert: (self response headerAt: 'X-Download-Options') = 'noopen'.
	self assert: (self response headers size) = 1
]

{ #category : #'*seaside-tests-internetexplorer' }
WAResponseTest >> testImNice [
	self response imNice.
	self assert: (self response headerAt: 'P3P') = 'CP="CAO PSA OUR"'.
	self assert: (self response headers size) = 1
]
