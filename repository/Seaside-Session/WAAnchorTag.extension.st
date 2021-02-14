Extension { #name : #WAAnchorTag }

{ #category : #'*seaside-session' }
WAAnchorTag >> document: aDocument [
	self document: aDocument mimeType: nil
]

{ #category : #'*seaside-session' }
WAAnchorTag >> document: aDocument mimeType: mimeType [
	self document: aDocument mimeType: mimeType fileName: nil
]

{ #category : #'*seaside-session' }
WAAnchorTag >> document: aDocument mimeType: mimeType fileName: fileName [
	self url: (canvas context urlForDocument: aDocument mimeType: mimeType fileName: fileName).
	mimeType isNil ifFalse: [
		self type: mimeType ]
]
