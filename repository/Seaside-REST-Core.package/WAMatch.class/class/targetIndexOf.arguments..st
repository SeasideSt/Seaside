private
targetIndexOf: aString arguments: aCollectionOfStrings
	aString do: [ :each |
		each isDigit ifFalse: [
			| index |
			index := aCollectionOfStrings indexOf: aString.
			index isZero ifTrue: [
				self argument: aString notFoundInd: aCollectionOfStrings ].
			^ index ] ].
	^ aString asNumber