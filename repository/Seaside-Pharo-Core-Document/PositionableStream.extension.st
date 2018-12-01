Extension { #name : #PositionableStream }

{ #category : #'*seaside-pharo-core' }
PositionableStream >> seasideMimeDocument [
	^ self contents seasideMimeDocument
]

{ #category : #'*seaside-pharo-core' }
PositionableStream >> seasideMimeDocumentType: aMimetype [
	^ self seasideMimeDocument
		mimeType: aMimetype;
		yourself
]
