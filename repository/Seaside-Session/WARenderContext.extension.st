Extension { #name : #WARenderContext }

{ #category : #'*seaside-session' }
WARenderContext >> urlForDocument: anObject [
	^ self urlForDocument: anObject mimeType: nil
]

{ #category : #'*seaside-session' }
WARenderContext >> urlForDocument: anObject mimeType: mimeString [
	^ self urlForDocument: anObject mimeType: mimeString fileName: nil
]

{ #category : #'*seaside-session' }
WARenderContext >> urlForDocument: anObject mimeType: mimeType fileName: fileName [
	| handler |
	handler := (WADocumentHandler
		document: anObject
		mimeType: mimeType
		fileName: fileName).
	^ self requestContext session register: handler
]
