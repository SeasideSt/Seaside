"
I allow mixing stateless and stateful Seaside application. I am intended for cases where there are a couple of stateless ""browse"" pages before sateful application pages that require a session. If a request comes in and has a session it gets dispatched to the application, otherwise it's treated as a normal REST request.
At any time session can be started from an initialized component by sending #startSessionWithRoot:.

To use me:
- subclass me
- add me to your application
- implement the methods for the URL patterns you need
- send #startSessionWithRoot: in your methods

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
