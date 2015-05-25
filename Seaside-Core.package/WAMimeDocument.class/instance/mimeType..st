accessing
mimeType: aMimeType
	mimeType := aMimeType isNil
		ifFalse: [ aMimeType seasideMimeType ]
		ifTrue: [ WAMimeType applicationOctetStream ]