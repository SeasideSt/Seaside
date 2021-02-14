Extension { #name : #WAContentElement }

{ #category : #'*seaside-session' }
WAContentElement >> document: aString [
	self document: aString mimeType: self typeOrNil
]

{ #category : #'*seaside-session' }
WAContentElement >> document: aString fileName: fileName [
	self document: aString mimeType: self typeOrNil fileName: fileName
]

{ #category : #'*seaside-session' }
WAContentElement >> document: aString mimeType: mimeType [
	self document: aString mimeType: mimeType fileName: nil
]

{ #category : #'*seaside-session' }
WAContentElement >> document: aString mimeType: mimeType fileName: fileName [
	self url: (root context urlForDocument: aString mimeType: mimeType fileName: fileName)
]
