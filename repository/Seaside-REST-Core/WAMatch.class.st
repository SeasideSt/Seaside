Class {
	#name : #WAMatch,
	#superclass : #WAObject,
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #private }
WAMatch class >> argument: aString notFoundInd: aCollectionOfStrings [
	WAArgumentNotFoundError signal: 'argument "', aString, '" was not found in ', aCollectionOfStrings greaseString
]

{ #category : #private }
WAMatch class >> targetIndexOf: aString arguments: aCollectionOfStrings [
	aString do: [ :each |
		each isDigit ifFalse: [
			| index |
			index := aCollectionOfStrings indexOf: aString.
			index isZero ifTrue: [
				self argument: aString notFoundInd: aCollectionOfStrings ].
			^ index ] ].
	^ aString asNumber
]
