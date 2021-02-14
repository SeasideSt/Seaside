"
Common superclass for step related tags
"
Class {
	#name : #WASteppedTag,
	#superclass : #WAAbstractTextAreaTag,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WASteppedTag >> step: anInteger [
	self attributeAt: 'step' put: anInteger
]
