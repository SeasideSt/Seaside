Extension { #name : #MIMEDocument }

{ #category : #'*seaside-pharo-core' }
MIMEDocument >> seasideMimeDocument [
	^ WAMimeDocument on: self content mimeType: self contentType
]

{ #category : #'*seaside-pharo-core' }
MIMEDocument >> seasideMimeDocumentType: aMimeType [
	^ self seasideMimeDocument mimeType: aMimeType; yourself
]
