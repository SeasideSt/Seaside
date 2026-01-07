"
Used to let the user enter and edit a telephone number
"
Class {
	#name : 'WATelephoneInputTag',
	#superclass : 'WAAbstractTextAreaTag',
	#category : 'Seaside-Canvas-Tags',
	#package : 'Seaside-Canvas',
	#tag : 'Tags'
}

{ #category : 'accessing' }
WATelephoneInputTag >> type [
	^ 'tel'
]
