"
Closes a WARevealedConditionalComment.
"
Class {
	#name : #WAClosingRevealedConditionalComment,
	#superclass : #WAObject,
	#category : 'Seaside-Core-Document-Elements'
}

{ #category : #printing }
WAClosingRevealedConditionalComment >> encodeOn: aDocument [
	aDocument nextPutAll: '<!--<![endif]-->'
]
