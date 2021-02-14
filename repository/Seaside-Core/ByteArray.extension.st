Extension { #name : #ByteArray }

{ #category : #'*Seaside-Core' }
ByteArray >> renderOn: aRenderer [
	aRenderer text: self
]

{ #category : #'*Seaside-Core' }
ByteArray >> seasideMimeDocument [
	^ WAMimeDocument on: self mimeType: WAMimeType applicationOctetStream
]

{ #category : #'*Seaside-Core' }
ByteArray >> seasideMimeDocumentType: aMimeType [
	^ self seasideMimeDocument
		mimeType: aMimeType;
		yourself
]
