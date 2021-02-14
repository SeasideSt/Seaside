"
I am the headers dictionary of an HTTP request or response.
"
Class {
	#name : #WAHeaderFields,
	#superclass : #GROrderedMultiMap,
	#category : 'Seaside-Core-HTTP'
}

{ #category : #private }
WAHeaderFields >> checkValue: aValue [
	(aValue isString and: [
		(aValue indexOf: Character cr) ~= 0
			or: [ (aValue indexOf: Character lf) ~= 0 ] ]) ifTrue: [
				WAInvalidHeaderValueError signal: 'invalid header value', aValue "we know this is a String now" ]
]

{ #category : #private }
WAHeaderFields >> errorKeyNotFound [
	^ nil
]

{ #category : #private }
WAHeaderFields >> privateAt: aKey put: aValue [
	self checkValue: aValue.
	^ super privateAt: aKey put: aValue
]
