Extension { #name : #WAResponseTest }

{ #category : #'*seaside-tests-security' }
WAResponseTest >> testNoSniff [
	self response noSniff.
	self assert: (self response headerAt: 'X-Content-Type-Options') = 'nosniff'.
	self assert: (self response headers size) = 1
]
