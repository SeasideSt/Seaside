"
Common superclass for step related tags
"
Class {
	#name : 'WASteppedTag',
	#superclass : 'WAAbstractTextAreaTag',
	#category : 'Seaside-Canvas-Tags',
	#package : 'Seaside-Canvas',
	#tag : 'Tags'
}

{ #category : 'testing' }
WASteppedTag class >> isAbstract [ 

	^ self == WASteppedTag
]

{ #category : 'attributes' }
WASteppedTag >> step: anInteger [
	self attributeAt: 'step' put: anInteger
]
