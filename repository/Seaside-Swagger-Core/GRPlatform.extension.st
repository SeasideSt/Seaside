Extension { #name : #GRPlatform }

{ #category : #'*seaside-swagger-core' }
GRPlatform >> classCommentOf: aClass [
	"Answer the comment of a class."
	self subclassResponsibility
]

{ #category : #'*seaside-swagger-core' }
GRPlatform >> methodCommentOf: aSelector in: aClass [
	"Answer the comment of a method."
	self subclassResponsibility
]
