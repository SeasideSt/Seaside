private
assertContents: aString
	self assert: self requestContext response contents = aString