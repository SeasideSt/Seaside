"
I match only on an exact number of path elements regardless of the query fields in the url.

I allow the creation of routes where the query fields are unknown beforehand, like when doing filtering, partial reads, etc.

You can access the query fields sending #queryFields to the aWARequest
"
Class {
	#name : #WAVariableQueryRoute,
	#superclass : #WAComplexRoute,
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #'as yet unclassified' }
WAVariableQueryRoute >> initializeQueryFieldParameters: queryFields arguments: aCollectionOfStrings [
	"Query field parameters are variable in the receiver, so they're not initialized."
	
]

{ #category : #'as yet unclassified' }
WAVariableQueryRoute >> matchesParameters: aDictionary [
	"Receiver will always match parameters, because they're variable."

	^ true
]
