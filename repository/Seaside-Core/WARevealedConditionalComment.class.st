"
A WAConditionalComment is an implementation of Downlevel-revealed Conditional Comments:
http://msdn2.microsoft.com/en-us/library/ms537512.aspx
Non-IE family browsers see them always.

See also WAOpeningRevealedConditionalComment and WARevealedConditionalComment.
"
Class {
	#name : #WARevealedConditionalComment,
	#superclass : #WAConditionalComment,
	#category : 'Seaside-Core-Document-Elements'
}

{ #category : #private }
WARevealedConditionalComment >> closingConditionClass [
	^ WAClosingRevealedConditionalComment
]

{ #category : #private }
WARevealedConditionalComment >> openingConditionClass [
	^ WAOpeningRevealedConditionalComment
]
