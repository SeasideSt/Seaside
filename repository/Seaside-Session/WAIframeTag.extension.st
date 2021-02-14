Extension { #name : #WAIframeTag }

{ #category : #'*seaside-session' }
WAIframeTag >> document: anObject [
	self document: anObject mimeType: nil
]

{ #category : #'*seaside-session' }
WAIframeTag >> document: anObject mimeType: aMimeString [
	self document: anObject mimeType: aMimeString fileName: nil
]

{ #category : #'*seaside-session' }
WAIframeTag >> document: anObject mimeType: aMimeString fileName: aFileNameString [
	self url: (canvas context
		urlForDocument: anObject
		mimeType: aMimeString
		fileName: aFileNameString)
]
