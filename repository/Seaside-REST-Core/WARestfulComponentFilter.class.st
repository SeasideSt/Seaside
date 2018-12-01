"
WARestfulComponentFilter has not been documented yet. The class comment should describe the purpose of the class, its collaborations and its variables.

I am the fault of Norbert.
"
Class {
	#name : #WARestfulComponentFilter,
	#superclass : #WARestfulFilter,
	#category : 'Seaside-REST-Core-Handler'
}

{ #category : #processing }
WARestfulComponentFilter >> handleFiltered: aRequestContext [
	(self hasSession: aRequestContext)
		ifTrue: [
			"evetually let the application handle the request"
			self next handleFiltered: aRequestContext ]
		ifFalse: [
			"search for a route"
			super handleFiltered: aRequestContext ]
	
]

{ #category : #private }
WARestfulComponentFilter >> hasSession: aRequestContext [
	| handler key |
	handler := self handler.
	key := handler trackingStrategy keyFromContext: aRequestContext.
	^ key notNil and: [
		"make sure the session is not expired"
		(handler cache at: key ifAbsent: [ nil ]) notNil ]
]

{ #category : #public }
WARestfulComponentFilter >> startSessionWithRoot: aComponent [
	| context |
	context := self requestContext.
	context rootComponent: aComponent.
	self next handleFiltered: context
]
