tests
testCommit
	self response
		contentType: 'text/html';
		nextPutAll: 'Visit <a href="http://www.seaside.st">seaside.st</a>.';
		commit.
		
	self assert: self response isCommitted