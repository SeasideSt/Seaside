"
I am the abstract base class for tracking strategies that track sessions differently from other request handlers (mostly WADocumentHandlers).

Concrete implementsions have to take care that expired document handlers don't expire sessions.
"
Class {
	#name : #WASessionTrackingStrategy,
	#superclass : #WAHandlerTrackingStrategy,
	#category : 'Seaside-Session'
}

{ #category : #testing }
WASessionTrackingStrategy class >> isAbstract [
	^ self name = #WASessionTrackingStrategy
]
