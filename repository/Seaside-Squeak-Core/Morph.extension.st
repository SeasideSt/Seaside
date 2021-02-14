Extension { #name : #Morph }

{ #category : #'*Seaside-Squeak-Core' }
Morph >> seasideMimeDocument [
	^ self imageForm seasideMimeDocument
]

{ #category : #'*Seaside-Squeak-Core' }
Morph >> seasideMimeDocumentType: aMimeType [
	^ self imageForm seasideMimeDocumentType: aMimeType
]
