"
I test swagger methods on GRPlatform
"
Class {
	#name : #WASwagger2PlatformTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Swagger-Core'
}

{ #category : #testing }
WASwagger2PlatformTest >> testClassCommentOf [
	| comment |
	comment := GRPlatform current classCommentOf: WACommentHandler.
	self assert: comment = 'This is the class comment.'
]

{ #category : #testing }
WASwagger2PlatformTest >> testMethodCommentOfIn [
	| comment |
	comment := GRPlatform current methodCommentOf: #comment in: WACommentHandler.
	self assert: comment = 'This is the method comment'
]
