"
Initiates and processes an AJAX request.
"
Class {
	#name : #PTRequest,
	#superclass : #PTAjax,
	#category : 'Prototype-Core-Ajax'
}

{ #category : #private }
PTRequest >> defaultPrototype [
	^ 'Ajax.Request'
]

{ #category : #processing }
PTRequest >> process [
	[ super process ] on: Error do: [ :err | err defaultAction ]
]

{ #category : #processing }
PTRequest >> processOn: aStream with: unused [
	callback isNil
		ifFalse: [ callback value ]
]
