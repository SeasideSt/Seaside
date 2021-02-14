Extension { #name : #MIMEDocument }

{ #category : #'*Seaside-Pharo-Core' }
MIMEDocument >> seasideMimeDocument [
	^ WAMimeDocument on: self content mimeType: self contentType
]

{ #category : #'*Seaside-Pharo-Core' }
MIMEDocument >> seasideMimeDocumentType: aMimeType [
	^ self seasideMimeDocument mimeType: aMimeType; yourself
]
