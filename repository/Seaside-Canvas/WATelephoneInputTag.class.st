"
Used to let the user enter and edit a telephone number
"
Class {
	#name : #WATelephoneInputTag,
	#superclass : #WAAbstractTextAreaTag,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #accessing }
WATelephoneInputTag >> type [
	^ 'tel'
]
