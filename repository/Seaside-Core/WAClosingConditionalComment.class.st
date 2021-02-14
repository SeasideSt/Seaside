"
Closes a WAConditionalComment.
"
Class {
	#name : #WAClosingConditionalComment,
	#superclass : #WAObject,
	#category : 'Seaside-Core-Document-Elements'
}

{ #category : #printing }
WAClosingConditionalComment >> encodeOn: aDocument [
	aDocument nextPutAll: '<![endif]-->'
]
