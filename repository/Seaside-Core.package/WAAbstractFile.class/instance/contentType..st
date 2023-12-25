accessing
contentType: aMimeTypeOrString
	contentType := aMimeTypeOrString isNil
		ifFalse: [ aMimeTypeOrString seasideMimeType ]