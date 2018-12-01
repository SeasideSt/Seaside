Extension { #name : #ByteArray }

{ #category : #'*seaside-core' }
ByteArray >> renderOn: aRenderer [
	aRenderer text: self
]

{ #category : #'*seaside-core' }
ByteArray >> seasideMimeDocument [
	^ WAMimeDocument on: self mimeType: WAMimeType applicationOctetStream
]

{ #category : #'*seaside-core' }
ByteArray >> seasideMimeDocumentType: aMimeType [
	^ self seasideMimeDocument
		mimeType: aMimeType;
		yourself
]
