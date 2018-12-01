Extension { #name : #Morph }

{ #category : #'*seaside-pharo-core' }
Morph >> seasideMimeDocument [
	^ self imageForm seasideMimeDocument
]

{ #category : #'*seaside-pharo-core' }
Morph >> seasideMimeDocumentType: aMimeType [
	^ self imageForm seasideMimeDocumentType: aMimeType
]
