Class {
	#name : 'SUInPlaceCollectionEditor',
	#superclass : 'SUInPlaceEditor',
	#category : 'Scriptaculous-Core-Controls',
	#package : 'Scriptaculous-Core',
	#tag : 'Controls'
}

{ #category : 'options' }
SUInPlaceCollectionEditor >> collection: anArray [
	self optionAt: 'collection' put: anArray
]

{ #category : 'private' }
SUInPlaceCollectionEditor >> defaultPrototype [
	^ 'Ajax.InPlaceCollectionEditor'
]
