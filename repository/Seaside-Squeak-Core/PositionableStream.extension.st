Extension { #name : #PositionableStream }

{ #category : #'*Seaside-Squeak-Core' }
PositionableStream >> seasideMimeDocument [
	^ self contents seasideMimeDocument
]

{ #category : #'*Seaside-Squeak-Core' }
PositionableStream >> seasideMimeDocumentType: aMimetype [
	^ self seasideMimeDocument
		mimeType: aMimetype;
		yourself
]
