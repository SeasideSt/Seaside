"
This is the class comment.
"
Class {
	#name : #WACommentHandler,
	#superclass : #WASwagger2RestfulHandler,
	#category : 'Seaside-Tests-Swagger-Core'
}

{ #category : #resources }
WACommentHandler >> comment [
	"This is the method comment"
	<get>
	<path: '/comment.txt'>

	^ 'no comment'
]
