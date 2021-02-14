Extension { #name : #PositionableStream }

{ #category : #'*Seaside-Pharo-Core' }
PositionableStream >> seasideMimeDocument [
	^ self contents seasideMimeDocument
]

{ #category : #'*Seaside-Pharo-Core' }
PositionableStream >> seasideMimeDocumentType: aMimetype [
	^ self seasideMimeDocument
		mimeType: aMimetype;
		yourself
]
