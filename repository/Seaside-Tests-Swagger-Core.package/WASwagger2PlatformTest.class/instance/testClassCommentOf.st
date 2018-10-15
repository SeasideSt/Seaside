testing
testClassCommentOf
	| comment |
	comment := GRPlatform current classCommentOf: WACommentHandler.
	self assert: comment = 'This is the class comment.'