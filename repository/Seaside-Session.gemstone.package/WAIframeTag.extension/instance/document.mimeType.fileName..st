*seaside-session
document: anObject mimeType: aMimeString fileName: aFileNameString
	self url: (canvas context
		urlForDocument: anObject
		mimeType: aMimeString
		fileName: aFileNameString)