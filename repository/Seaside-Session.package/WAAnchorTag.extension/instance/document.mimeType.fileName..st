*seaside-session
document: aDocument mimeType: mimeType fileName: fileName
	self url: (canvas context urlForDocument: aDocument mimeType: mimeType fileName: fileName).
	mimeType isNil ifFalse: [
		self type: mimeType ]