accessing
mimetypeFor: aString
	^ (self mimetypes at: aString ifAbsent: [ self defaultMimeType ]) seasideMimeType