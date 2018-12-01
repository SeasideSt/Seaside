"
This filter provides the implementation of WAComponent>>#isolate:. It rejects all requests as soon as the filter has been closed.
"
Class {
	#name : #WATransactionFilter,
	#superclass : #WARequestFilter,
	#instVars : [
		'closed'
	],
	#category : 'Seaside-Core-Filter'
}

{ #category : #actions }
WATransactionFilter >> close [
	closed := true
]

{ #category : #processing }
WATransactionFilter >> handleFiltered: aRequestContext [ 
	self isClosed 
		ifFalse: [ super handleFiltered: aRequestContext ]
		ifTrue: [ 
			aRequestContext responseGenerator
				pageExpired;
				respond ]
]

{ #category : #initialization }
WATransactionFilter >> initialize [
	super initialize.
	closed := false
]

{ #category : #testing }
WATransactionFilter >> isClosed [
	^ closed
]
