"
Opens a WARevealedConditionalComment and encodes the condition.
"
Class {
	#name : #WAOpeningRevealedConditionalComment,
	#superclass : #WAOpeningConditionalComment,
	#category : 'Seaside-Core-Document-Elements'
}

{ #category : #printing }
WAOpeningRevealedConditionalComment >> encodeOn: aDocument [
	aDocument
		nextPutAll: '<!--[';
		nextPutAll: self condition;
		nextPutAll: ']><!-->'
]
