testing
testMethodCommentOfIn
	| comment |
	comment := GRPlatform current methodCommentOf: #comment in: WACommentHandler.
	self assert: comment = 'This is the method comment'