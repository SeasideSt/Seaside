testing
testPragmaAtIn
	| pragma |
	pragma := GRPlatform current pragmaAt: #path: in: WACommentHandler >> #comment.
	self assert: pragma notNil