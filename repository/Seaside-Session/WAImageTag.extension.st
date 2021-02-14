Extension { #name : #WAImageTag }

{ #category : #'*seaside-session' }
WAImageTag >> document: aDocument [
	self document: aDocument mimeType: nil
]

{ #category : #'*seaside-session' }
WAImageTag >> document: aDocument mimeType: mimeType [
	self document: aDocument mimeType: mimeType fileName: nil
]

{ #category : #'*seaside-session' }
WAImageTag >> document: aDocument mimeType: mimeType fileName: fileName [
	self url: (canvas context urlForDocument: aDocument mimeType: mimeType fileName: fileName)
]
