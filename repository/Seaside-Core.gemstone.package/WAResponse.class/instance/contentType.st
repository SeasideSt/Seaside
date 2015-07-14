convenience-accessing
contentType
	^ self headerAt: 'Content-Type' ifAbsent: [ WAMimeType textPlain ]