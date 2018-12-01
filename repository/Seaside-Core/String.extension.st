Extension { #name : #String }

{ #category : #'*seaside-core' }
String >> asCapitalizedPhrase [
	| read words currentWord capitalizedWord |
	(self noneSatisfy: [ :ea | ea isLowercase ])
		ifTrue: [ ^ self ].
	words := WriteStream on: String new.
	read := ReadStream on: self.
	[ read atEnd ] whileFalse: [
		currentWord := WriteStream on: String new.
		currentWord nextPut: read next.
		[ | x | x := read peek. x isNil or: [ x isUppercase ] ]
			whileFalse: [ currentWord nextPut: read next ].
		capitalizedWord := currentWord contents capitalized.
			(#(Of In At A Or To By) includes: capitalizedWord)
				ifTrue: [ capitalizedWord := capitalizedWord asLowercase ].
		words nextPutAll: capitalizedWord.
		words nextPutAll: ' ' ].
	words skip: -1.
	^ words contents
]

{ #category : #'*seaside-core' }
String >> encodeOn: aDocument [
	aDocument xmlEncoder nextPutAll: self
]

{ #category : #'*seaside-core' }
String >> renderOn: aRenderer [
	aRenderer text: self
]

{ #category : #'*seaside-core' }
String >> seasideMimeDocument [
	^ WAMimeDocument on: self mimeType: WAMimeType textPlain
]

{ #category : #'*seaside-core' }
String >> seasideMimeDocumentType: aMimeType [
	^ self seasideMimeDocument
		mimeType: aMimeType;
		yourself
]

{ #category : #'*seaside-core' }
String >> seasideMimeType [
	^ WAMimeType fromString: self
]

{ #category : #'*seaside-core' }
String >> seasideUrl [
	^ WAUrl absolute: self
]
