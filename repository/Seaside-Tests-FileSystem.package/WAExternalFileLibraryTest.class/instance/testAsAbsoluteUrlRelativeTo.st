testing
testAsAbsoluteUrlRelativeTo
	| request |
	fileSystem configuration 
		at: #directory
		put: '/home/philppe/pr0n'.
	request := self requestWithUrl: '/culture/pictures'.
	self assert: (fileSystem 
			asAbsoluteUrl: 'cleopatra.jpeg'
			relativeTo: request) greaseString = '/culture/pictures/cleopatra.jpeg'.
	request := self requestWithUrl: '/culture/pictures/'.
	self assert: (fileSystem 
			asAbsoluteUrl: 'cleopatra.jpeg'
			relativeTo: request) greaseString = '/culture/pictures/cleopatra.jpeg'