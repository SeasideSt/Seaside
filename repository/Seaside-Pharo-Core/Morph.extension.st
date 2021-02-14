Extension { #name : #Morph }

{ #category : #'*Seaside-Pharo-Core' }
Morph >> seasideMimeDocument [
	^ self imageForm seasideMimeDocument
]

{ #category : #'*Seaside-Pharo-Core' }
Morph >> seasideMimeDocumentType: aMimeType [
	^ self imageForm seasideMimeDocumentType: aMimeType
]
