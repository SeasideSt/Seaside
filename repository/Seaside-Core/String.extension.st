Extension { #name : #String }

{ #category : #'*Seaside-Core' }
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

{ #category : #'*Seaside-Core' }
String >> encodeOn: aDocument [
	aDocument xmlEncoder nextPutAll: self
]

{ #category : #'*Seaside-Core' }
String >> renderOn: aRenderer [
	aRenderer text: self
]

{ #category : #'*Seaside-Core' }
String >> seasideMimeDocument [
	^ WAMimeDocument on: self mimeType: WAMimeType textPlain
]

{ #category : #'*Seaside-Core' }
String >> seasideMimeDocumentType: aMimeType [
	^ self seasideMimeDocument
		mimeType: aMimeType;
		yourself
]

{ #category : #'*Seaside-Core' }
String >> seasideMimeType [
	^ WAMimeType fromString: self
]

{ #category : #'*Seaside-Core' }
String >> seasideUrl [
	^ WAUrl absolute: self
]
