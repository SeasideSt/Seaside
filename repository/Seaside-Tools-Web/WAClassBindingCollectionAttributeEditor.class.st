Class {
	#name : #WAClassBindingCollectionAttributeEditor,
	#superclass : #WACollectionAttributeEditor,
	#category : 'Seaside-Tools-Web'
}

{ #category : #private }
WAClassBindingCollectionAttributeEditor >> optionForValue: anObject [
	^ anObject value
]

{ #category : #private }
WAClassBindingCollectionAttributeEditor >> valueForOption: anObject [
	^ GRPlatform current bindingOf: anObject
]
