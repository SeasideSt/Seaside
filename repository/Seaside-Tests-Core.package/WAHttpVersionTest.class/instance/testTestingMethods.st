tests
testTestingMethods
	| v10 v11 |
	v10 := WAHttpVersion major: 1 minor: 0.
	v11 := WAHttpVersion major: 1 minor: 1.
	
	self assert: v10 isHttp10.
	self deny: v11 isHttp10.
	self assert: v11 isHttp11.
	self deny: v10 isHttp11