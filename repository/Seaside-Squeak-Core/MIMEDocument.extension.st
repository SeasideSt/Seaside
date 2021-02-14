Extension { #name : #MIMEDocument }

{ #category : #'*Seaside-Squeak-Core' }
MIMEDocument >> seasideMimeDocument [
	^ WAMimeDocument on: self content mimeType: self contentType
]

{ #category : #'*Seaside-Squeak-Core' }
MIMEDocument >> seasideMimeDocumentType: aMimeType [
	^ self seasideMimeDocument mimeType: aMimeType; yourself
]
