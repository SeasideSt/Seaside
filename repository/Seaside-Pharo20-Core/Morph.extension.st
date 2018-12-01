Extension { #name : #Morph }

{ #category : #'*seaside-pharo20-core' }
Morph >> seasideMimeDocument [
	^ self imageForm seasideMimeDocument
]

{ #category : #'*seaside-pharo20-core' }
Morph >> seasideMimeDocumentType: aMimeType [
	^ self imageForm seasideMimeDocumentType: aMimeType
]
