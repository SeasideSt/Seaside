"
Creates a Cancel submit button.
"
Class {
	#name : 'WACancelButtonTag',
	#superclass : 'WASubmitButtonTag',
	#category : 'Seaside-Canvas-Tags',
	#package : 'Seaside-Canvas',
	#tag : 'Tags'
}

{ #category : 'callbacks' }
WACancelButtonTag >> callback: aBlock [
	self name: (self storeCallback: (WACancelActionCallback on: aBlock))
]
