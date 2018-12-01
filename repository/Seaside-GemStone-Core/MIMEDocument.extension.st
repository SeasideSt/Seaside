Extension { #name : #MIMEDocument }

{ #category : #'*seaside-gemstone-core' }
MIMEDocument >> asMIMEDocument [
	^self
]

{ #category : #'*seaside-gemstone-core' }
MIMEDocument >> asMIMEDocumentType: mimeType [
	^self
]

{ #category : #'*seaside-gemstone-core' }
MIMEDocument >> seasideMimeDocument [

	^WAMimeDocument on: self content mimeType: self contentType
]

{ #category : #'*seaside-gemstone-core' }
MIMEDocument >> seasideMimeDocumentType: aMimetype [

	^self seasideMimeDocument mimeType: aMimetype; yourself
]
