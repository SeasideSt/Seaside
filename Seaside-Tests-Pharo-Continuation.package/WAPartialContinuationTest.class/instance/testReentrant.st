tests
testReentrant
	| kk |
	self assert: (self mark: [ 
		2 * (self callcc: [ :cc | 
			kk := cc. 2 ]) ]) 
				= 4.
	
	self assert: (self mark: [
		kk value: 3 ]) 
			= 6.
	self assert: (self mark: [
		kk value: 4 ]) 
			= 8.
	self assert: (self mark: [
		kk value: 5 ]) 
			= 10