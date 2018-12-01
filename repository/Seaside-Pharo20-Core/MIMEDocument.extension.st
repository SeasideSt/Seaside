Extension { #name : #MIMEDocument }

{ #category : #'*seaside-pharo20-core' }
MIMEDocument >> seasideMimeDocument [
	^ WAMimeDocument on: self content mimeType: self contentType
]

{ #category : #'*seaside-pharo20-core' }
MIMEDocument >> seasideMimeDocumentType: aMimeType [
	^ self seasideMimeDocument mimeType: aMimeType; yourself
]
