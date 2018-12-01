Extension { #name : #PositionableStream }

{ #category : #'*seaside-pharo20-core' }
PositionableStream >> seasideMimeDocument [
	^ self contents seasideMimeDocument
]

{ #category : #'*seaside-pharo20-core' }
PositionableStream >> seasideMimeDocumentType: aMimetype [
	^ self seasideMimeDocument
		mimeType: aMimetype;
		yourself
]
