encoding
encodeAssociation: anAssociation on: aRenderer
	| key value |
	"key -> nil: ""key""
	 key -> aString: ""key=aString(urlEncoded)""
	key -> anObject: ""key=""+encodeURIComponent(anObject)"
	key := anAssociation key.
	value := anAssociation value.
	aRenderer document
		beginString
		urlEncode: key greaseString.
	value isNil ifTrue: [
		aRenderer document endString.
		^ self ].
	
	aRenderer document nextPut: $=.
	(value isString or: [ value isCharacter ]) ifTrue: [
		aRenderer document
				urlEncode: value greaseString;
				endString	.
		^ self ].
	aRenderer document
		endString;
		operator: '+'.
	aRenderer encodeURIComponent: value