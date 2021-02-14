"
See superclass.
"
Class {
	#name : #WAMultiSelectTag,
	#superclass : #WASelectTag,
	#instVars : [
		'callback'
	],
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #accessing }
WAMultiSelectTag >> callbackClass [
	^ WAMultipleValuesCallback
]

{ #category : #private }
WAMultiSelectTag >> closeTag [
	super closeTag.
	self hasCallback ifFalse: [ ^ self ].
	canvas hiddenInput
		callback: [ self triggerCallback ].
	canvas flush
]

{ #category : #testing }
WAMultiSelectTag >> isSelected: anObject [
	^ selected notNil and: [ selected includes: anObject ]
]

{ #category : #private }
WAMultiSelectTag >> openTag [
	self attributes at: 'multiple' put: true.
	super openTag

]

{ #category : #private }
WAMultiSelectTag >> storeCallback: aCallback [
	^ super storeCallback: (callback := aCallback)
]

{ #category : #private }
WAMultiSelectTag >> triggerCallback [
	"Ensure that the callback triggers even if the browser does not submit a value."

	self requestContext request
		at: callback key
		ifAbsent: [ callback evaluateWithFieldValues: #() ]
]
