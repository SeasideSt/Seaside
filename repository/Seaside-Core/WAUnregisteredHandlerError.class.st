"
This error is signaled by WARegistry whenever an attempt is made to find the key or URL for a handler that is not registered in its cache.
"
Class {
	#name : #WAUnregisteredHandlerError,
	#superclass : #WAError,
	#category : 'Seaside-Core-Exceptions'
}

{ #category : #accessing }
WAUnregisteredHandlerError >> seasidePossibleCauses [
	^ #(
		'You are trying to use a session or other request handler that has expired'
	)
]
