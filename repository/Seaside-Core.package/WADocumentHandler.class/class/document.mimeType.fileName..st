instance creation
document: anObject mimeType: aMimeType fileName: aString
	| document |
	document := aMimeType isNil
		ifTrue: [ anObject seasideMimeDocument ]
		ifFalse: [ anObject seasideMimeDocumentType: aMimeType ].
	aString isNil
		ifFalse: [ document fileName: aString ].
	^ self document: document